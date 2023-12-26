//
//  LoginView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 10/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State var countryCode: String = ""

    @EnvironmentObject private var sessionManager: SessionManager
    @EnvironmentObject private var coordinator: AuthCoordinator
    @StateObject var loginViewModel: LoginViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Text("Let's Login")
                        .applyLabelStyle(style: .Heading3, color: .neutrals900)
                    
                    Spacer()
                }
                Image(SystemDesign.AppImages.AppLogoBlue500.name)
                    .resizable()
                    .frame(width: 250, height: 250)
                //.padding(.vertical, -20)
                HStack {
                    Text("Email Address")
                        .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                    Spacer()
                }
                .padding(.bottom, -4)
                HStack() {
                    CustomTextField(
                        keyboardContentType: .emailAddress,
                        keyboardType: .emailAddress,
                        hint: "Enter Email",
                        hintStyle: .BodyMediumRegular,
                        hintColor: .neutrals600,
                        backgroundColor: .neutrals100,
                        cornerRadius: 8,
                        isSecureField: false,
                        height: 30,
                        text: $loginViewModel.email,
                        isTextFieldValid: $loginViewModel.isEmailValid)
                }
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(.red)
                    Text(loginViewModel.isEmailValidErrorMessage)
                        .applyLabelStyle(style: .BodySmallRegular, color: .red)
                    Spacer()
                }
                .padding(.top, -5)
                .opacity(loginViewModel.showEmailErrorMessage)
                HStack {
                    Text("Password")
                        .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                    Spacer()
                }
                .padding(.top, 8)
                HStack() {
                    CustomTextField(
                        keyboardContentType: .name,
                        keyboardType: .default,
                        hint: "Enter Password",
                        hintStyle: .BodyMediumRegular,
                        hintColor: .neutrals600,
                        backgroundColor: .neutrals100,
                        cornerRadius: 8,
                        isSecureField: true,
                        height: 30,
                        text: $loginViewModel.userPassword,
                        isTextFieldValid: $loginViewModel.isUserPasswordValid)
                }
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(loginViewModel.isUserPasswordValidErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(loginViewModel.showUserPassswordErrorMessage)
                    Spacer()
                    Button {
                        coordinator.push(.forgetPassword)
                    } label: {
                        Text("ForgetPassword?")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .blue500)
                    }

                }
               
                Spacer()
                Button(action: {
                    Task {
                       try await loginViewModel.signIn()
                    }
                }) {
                    Text("Login")
                        .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue50)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(formIsValid ? .blue500 : .blue200)
                        .cornerRadius(8)
                    
                }
                .disabled(!formIsValid)
                HStack(spacing: 3) {
                    Spacer()
                    Text("Don’t have an account?")
                        .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                    Button(action: {
                        coordinator.pop()
                    }) {
                        Text("Sign Up")
                            .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue500)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .onTapGesture {
                // Resign first responder status to close the keyboard
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .alert(loginViewModel.error?.name ?? "Error", isPresented: $loginViewModel.showAlert, presenting: loginViewModel.error) { details in
                Button("OK", role: .cancel) { }
            } message: { details in
                Text(details.error)
            }
            if loginViewModel.showLoading {
                ProgressView()
                    .tint(.blue500)
                    .scaleEffect(3)
            }
        }
        .onChange(of: loginViewModel.userSession, {
            sessionManager.userSession = loginViewModel.userSession
            sessionManager.currentUser = loginViewModel.currentUser
        })
        .customBackButton()
    }
}

extension LoginView {
    var formIsValid: Bool {
        return loginViewModel.isEmailValid
        && loginViewModel.isUserPasswordValid
    }
}

//#Preview {
//    LoginView()
//}
