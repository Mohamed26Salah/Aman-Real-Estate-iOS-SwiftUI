//
//  ForgetPassword.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 21/12/2023.
//

import SwiftUI

struct ForgetPasswordView: View {

    @EnvironmentObject private var sessionManager: SessionManager
    @EnvironmentObject private var coordinator: AuthCoordinator
    @StateObject var loginViewModel: LoginViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Text("Forget Password?")
                        .applyLabelStyle(style: .Heading3, color: .neutrals900)
                    
                    Spacer()
                }
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
                
                Button(action: {
                    Task {
                        await loginViewModel.resetPassword()
                    }
                }) {
                    Text("Recover")
                        .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue50)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(formIsValid ? .blue500 : .blue200)
                        .cornerRadius(8)
                    
                }
                .disabled(!formIsValid)
                Spacer()
            }
            .padding(.horizontal, 16)
            .onTapGesture {
                // Resign first responder status to close the keyboard
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .customBackButton()
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
}
extension ForgetPasswordView {
    var formIsValid: Bool {
        return loginViewModel.isEmailValid
    }
}
//#Preview {
//    ForgetPasswordView()
//}
 
