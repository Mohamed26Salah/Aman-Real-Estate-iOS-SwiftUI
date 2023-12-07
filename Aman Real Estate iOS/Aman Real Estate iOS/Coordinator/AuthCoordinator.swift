//
//  AuthCoordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI

enum AuthPage: Identifiable, Hashable {
    case login, register, forgotPassword
    
    var id: Self { self }
}

enum AuthSheet: Identifiable {
    case termsAndConditions, privacyPolicy
    
    var id: Self { self }
}

enum AuthFullScreenCover: Identifiable {
    case welcome
    
    var id: Self { self }
}

class AuthCoordinator: GenericCoordinator<AuthPage, AuthSheet, AuthFullScreenCover> {
    @ViewBuilder
    func build(page: AuthPage) -> some View {
        switch page {
        case .login:
            ContentView()
        case .register:
            ContentView2()
        case .forgotPassword:
            ContentView()
        }
    }
    
    @ViewBuilder
    func build(sheet: AuthSheet) -> some View {
        switch sheet {
        case .termsAndConditions:
            ContentView()
        case .privacyPolicy:
            ContentView2()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: AuthFullScreenCover) -> some View {
        switch fullScreenCover {
        case .welcome:
            ContentView()
        }
    }
}
