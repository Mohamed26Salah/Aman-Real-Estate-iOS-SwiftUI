//
//  Keys.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import Foundation

enum StorageKeys {
    enum UserDefaults {
        static let showOnboardingScreen = "didShowOnboarding"
        static let fireBaseToken = "fcmTokenKey"
        static let savedUser = "SavedUser"
    }
    
    enum Keychain {
        static let userToken = "UserToken"
    }
}
