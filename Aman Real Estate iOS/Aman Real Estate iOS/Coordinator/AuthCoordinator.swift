//
//  AuthCoordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI

enum AuthPage: Hashable, Equatable {
    case login, register, forgetPassword
    case otp(phoneNumber: String)
    
//    var id: Self { self }
}

enum AuthSheet: Identifiable, Equatable {
    
    static func == (lhs: AuthSheet, rhs: AuthSheet) -> Bool {
        return lhs.id == rhs.id
    }
    
    case countryCodes(countryCode: Binding<String>)
    
    var id: String {
        switch self {
        case .countryCodes:
            return "countryCodes"
            // Add other cases as needed
        }
    }
}

enum AuthFullScreenCover: Identifiable, Equatable {
    case welcome
    
    var id: Self { self }
}

class AuthCoordinator: GenericCoordinator<AuthPage, AuthSheet, AuthFullScreenCover> {
    var loginViewModel = LoginViewModel()
    var registerViewModel = RegisterViewModel()
    
    @ViewBuilder
    func build(page: AuthPage) -> some View {
        switch page {
        case .login:
            LoginView(loginViewModel: self.loginViewModel)
        case .register:
            RegisterView(registerViewModel: self.registerViewModel)
        case .otp(let phoneNumber):
            OTPView(phoneNumber: phoneNumber)
        case .forgetPassword:
            ForgetPasswordView(loginViewModel: self.loginViewModel)
        }
    }
    
    @ViewBuilder
    func build(sheet: AuthSheet) -> some View {
        switch sheet {
        case .countryCodes(let countryCode):
            CountryCodesView(countryCode: countryCode)
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: AuthFullScreenCover) -> some View {
        switch fullScreenCover {
        case .welcome:
            EmptyView()
        }
    }
}

