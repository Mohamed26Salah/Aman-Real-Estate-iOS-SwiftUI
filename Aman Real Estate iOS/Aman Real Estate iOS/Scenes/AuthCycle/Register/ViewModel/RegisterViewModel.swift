//
//  RegisterViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 15/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Combine


class RegisterViewModel: BaseAuthViewModel {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
  
    @Published var email: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isEmailValidErrorMessage: String = ""
    @Published var showEmailErrorMessage: CGFloat = 0.0
    
    @Published var userPassword: String = ""
    @Published var isUserPasswordValid: Bool = false
    @Published var isUserPasswordValidErrorMessage: String = ""
    @Published var showUserPassswordErrorMessage: CGFloat = 0.0
    
    @Published var phoneNumber: String = ""
    @Published var isphoneNumberValid: Bool = false
    @Published var isphoneNumberValidErrorMessage: String = ""
    @Published var showPhoneNumberErrorMessage: CGFloat = 0.0

    @Published var fullName: String = ""
    @Published var isFullNameValid: Bool = false
    @Published var isFullNameValidErrorMessage: String = ""
    @Published var showFullNameErrorMessage: CGFloat = 0.0
    
    @Published var agreedOnTerms: Bool = false
    @Published var agreedOnTermsErrorMessage: String = ""
    @Published var showAgreedOnTermsErrorMessage: CGFloat = 0.0

    @Published var countryCodes: String = ""
    
    
    override init() {
        super.init()
        realTimeValidation()
    }
    
    
}

//MARK: Real Time Validation
extension RegisterViewModel {
    func realTimeValidation() {
        $email
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                if !Validation.isValidEmail(email) {
                    self.isEmailValidErrorMessage = "Invalid email format"
                    self.showEmailErrorMessage = 1.0
                    return false
                } else {
                    self.isEmailValidErrorMessage = ""
                    self.showEmailErrorMessage = 0.0
                    return true
                }
            }
            .assign(to: &$isEmailValid)
        
        $userPassword
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                if !Validation.isPasswordValid(password) {
                    self.isUserPasswordValidErrorMessage = "Invalid password format"
                    self.showUserPassswordErrorMessage = 1.0
                    return false
                } else {
                    self.isUserPasswordValidErrorMessage = ""
                    self.showUserPassswordErrorMessage = 0.0
                    return true
                }
            }
            .assign(to: &$isUserPasswordValid)
        
        $phoneNumber
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phoneNumber in
                if !Validation.isValidMobileNumber(phoneNumber) {
                    self.isphoneNumberValidErrorMessage = "Invalid phone number format"
                    self.showPhoneNumberErrorMessage = 1.0
                    return false
                } else {
                    self.isphoneNumberValidErrorMessage = ""
                    self.showPhoneNumberErrorMessage = 0.0
                    return true
                }
            }
            .assign(to: &$isphoneNumberValid)
        
        $fullName
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { fullName in
                if !Validation.isValidUsername(fullName) {
                    self.isFullNameValidErrorMessage = "Invalid full name format"
                    self.showFullNameErrorMessage = 1.0
                    return false
                } else {
                    self.isFullNameValidErrorMessage = ""
                    self.showFullNameErrorMessage = 0.0
                    return true
                }
            }
            .assign(to: &$isFullNameValid)
    }
}

//MARK: API Call

@MainActor
extension RegisterViewModel {
    func createUser() async throws {
        self.showLoading = true
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: userPassword)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email, phoneNumber: phoneNumber, role: .user)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            self.showLoading = false
        } catch {
            print(error)
            self.showLoading = false
            self.showAlert.toggle()
            self.error = ErrorDetails(name: "Error", error: error.localizedDescription)
        }
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapShot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapShot.data(as: User.self)
    }
}
