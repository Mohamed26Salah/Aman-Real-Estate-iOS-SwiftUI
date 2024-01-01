//
//  LoginViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 15/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Combine


class LoginViewModel: BaseAuthViewModel {
    
    @Published var email: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isEmailValidErrorMessage: String = ""
    @Published var showEmailErrorMessage: CGFloat = 0.0
    
    @Published var userPassword: String = ""
    @Published var isUserPasswordValid: Bool = false
    @Published var isUserPasswordValidErrorMessage: String = ""
    @Published var showUserPassswordErrorMessage: CGFloat = 0.0
        
    nonisolated
    override init() {
        super.init()
        realTimeValidation()
    }
    
    
}

//MARK: Real Time Validation
extension LoginViewModel {
    func realTimeValidation() {
        $email
            .dropFirst()
            .debounce(for: 0.4, scheduler: RunLoop.main)
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
            .debounce(for: 0.4, scheduler: RunLoop.main)
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
    }
}

//MARK: API Call

@MainActor
extension LoginViewModel {
    func signIn() async throws {
        self.showLoading = true
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: userPassword)
            self.userSession = result.user
            await fetchUser()
            self.showLoading = false
        } catch {
            self.showLoading = false
            self.showAlert.toggle()
            self.error = ErrorDetails(name: "Error", error: error.localizedDescription)
        }
    }
//    func fetchUser() async {
//        guard let uid = Auth.auth().currentUser?.uid else {return}
//        guard let snapShot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
//        self.currentUser = try? snapShot.data(as: User.self)
//    }
    func resetPassword() async {
        self.error = ErrorDetails(name: "Note", error: "An Email has been sent to \(email) to reset password.")
            self.showAlert.toggle()
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
        } catch {
            self.error = ErrorDetails(name: "Error", error: error.localizedDescription)
            self.showAlert.toggle()
        }
    }
}
