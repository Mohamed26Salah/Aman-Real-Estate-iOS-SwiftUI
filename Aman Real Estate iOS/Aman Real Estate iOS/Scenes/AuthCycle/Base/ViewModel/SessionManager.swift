//
//  SessionManager.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 15/12/2023.
//

import Firebase
import FirebaseAuth
import SwiftUI
@MainActor
class SessionManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    init() {
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapShot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapShot.data(as: User.self)
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
//            self.showAlert.toggle()
//            self.error = ErrorDetails(name: "Error", error: error.localizedDescription)
        }
    }
}
