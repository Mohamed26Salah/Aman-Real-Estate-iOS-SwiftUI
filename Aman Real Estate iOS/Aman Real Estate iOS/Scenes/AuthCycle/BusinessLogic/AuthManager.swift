//
//  AuthManager.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 18/12/2023.
//

import Firebase
import FirebaseAuth
import Foundation
//MARK: Cancelled// Needs Developer paid Account
class AuthManager {
    static let shared = AuthManager()
    private var verificationId: String?
    private let auth = Auth.auth()
    private var userSession: FirebaseAuth.User?
    
    public func startAuth(phoneNumber: String) async throws {
        do {
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil)
            verificationId = result
        } catch {
            print(error)
        }

    }
    public func verifyCode(smsCode: String) async throws {
        guard let verificationId = verificationId else {
            return
        }
        do {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)
            let result = try await auth.signIn(with: credential)
            userSession = result.user
        } catch {
            print(error)
        }
        
    }
}
