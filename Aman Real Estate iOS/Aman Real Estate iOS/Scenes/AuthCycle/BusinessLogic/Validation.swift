//
//  Validation.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 18/12/2023.
//

import Foundation

class Validation {
    static func isEmpty(_ string: String) -> Bool {
        let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.isEmpty
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: trimmedEmail)
    }
    
    static func isValidUsername(_ username: String) -> Bool {
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: trimmedUsername)
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: trimmedPassword)
    }
    
    static func doPasswordsMatch(password: String, confirmPassword: String) -> Bool {
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedConfirmPassword = confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedPassword == trimmedConfirmPassword
    }
    
    static func isValidMobileNumber(_ mobileNumber: String) -> Bool {
        let trimmedMobileNumber = mobileNumber.trimmingCharacters(in: .whitespacesAndNewlines)
//        let mobileNumberRegEx = "^[0-9]{10}$"
        let mobileNumberRegEx = "^[1-9]{1}[0-9]{3,14}([0-9]{9,14})?$"
        let mobileNumberPred = NSPredicate(format: "SELF MATCHES %@", mobileNumberRegEx)
        return mobileNumberPred.evaluate(with: trimmedMobileNumber)
    }
}

