//
//  BaseViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class BaseAuthViewModel: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var error: ErrorDetails?
    @Published var showLoading: Bool = false
    @Published var isLoading: Bool = true
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapShot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapShot.data(as: User.self)
    }
}

//MARK: - Common Local Calls -
extension BaseAuthViewModel {

}

