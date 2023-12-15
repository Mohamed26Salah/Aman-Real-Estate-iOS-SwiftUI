//
//  SessionManager.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 15/12/2023.
//

import Firebase
import FirebaseAuth
import SwiftUI

class SessionManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
}
