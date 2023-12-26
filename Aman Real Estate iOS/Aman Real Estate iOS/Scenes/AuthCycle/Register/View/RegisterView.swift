//
//  RegisterView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 11/12/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var countryCode: String = ""
    
    @EnvironmentObject private var sessionManager: SessionManager
    @EnvironmentObject private var coordinator: AuthCoordinator
    @StateObject var registerViewModel: RegisterViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10) {
                    HStack {
                        Text("Sign Up")
                            .applyLabelStyle(style: .Heading3, color: .neutrals900)
                        
                        Spacer()
                    }
                    Image(SystemDesign.AppImages.AppLogoBlue500.name)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.vertical, -20)
                    HStack {
                        Text("Name")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                        Spacer()
                    }
                    HStack() {
                        CustomTextField(
                            keyboardContentType: .name,
                            keyboardType: .default,
                            hint: "Enter Name",
                            hintStyle: .BodyMediumRegular,
                            hintColor: .neutrals600,
                            backgroundColor: .neutrals100,
                            cornerRadius: 8,
                            isSecureField: false,
                            height: 30,
                            text: $registerViewModel.fullName,
                            isTextFieldValid: $registerViewModel.isFullNameValid)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(registerViewModel.isFullNameValidErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(registerViewModel.showFullNameErrorMessage)
                    
                    HStack {
                        Text("Phone Number")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        HStack {
                            Image(SystemDesign.AppImages.eg.name)
                                .resizable()
                                .frame(width: 27, height: 20)
                            Text("+20")
                                .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                        }
                        .padding(17)
                        .background(SystemDesign.AppColors.Neutrals100.color)
                        .cornerRadius(8)
                        .onTapGesture {
                            coordinator.present(sheet: .countryCodes(countryCode: $countryCode))
                        }
                        CustomTextField(
                            keyboardContentType: .telephoneNumber,
                            keyboardType: .numberPad,
                            hint: "Enter Phone Number",
                            hintStyle: .BodyMediumRegular,
                            hintColor: .neutrals600,
                            backgroundColor: .neutrals100,
                            cornerRadius: 8,
                            isSecureField: false,
                            height: 30,
                            text: $registerViewModel.phoneNumber,
                            isTextFieldValid: $registerViewModel.isphoneNumberValid)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(registerViewModel.isphoneNumberValidErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(registerViewModel.showPhoneNumberErrorMessage)
                    HStack {
                        Text("Email Address")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                        Spacer()
                    }
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
                            text: $registerViewModel.email,
                            isTextFieldValid: $registerViewModel.isEmailValid)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(registerViewModel.isEmailValidErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(registerViewModel.showEmailErrorMessage)
                    HStack {
                        Text("Password")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                        Spacer()
                    }
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
                            text: $registerViewModel.userPassword,
                            isTextFieldValid: $registerViewModel.isUserPasswordValid)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(registerViewModel.isUserPasswordValidErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(registerViewModel.showUserPassswordErrorMessage)
                    HStack(spacing: 3) {
                        Text("I agree with")
                            .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                        
                        Button(action: {
                            
                        }) {
                            Text("Term of Conditions")
                                .applyLabelStyle(style: .BodyMediumRegular, color: .blue500)
                        }
                        
                        Text("and")
                            .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                        
                        Button(action: {
                            
                        }) {
                            Text("Privacy Policy")
                                .applyLabelStyle(style: .BodyMediumRegular, color: .blue500)
                        }
                        Toggle("", isOn: $registerViewModel.agreedOnTerms)
                            .toggleStyle(SwitchToggleStyle(tint: .blue500))
                            .labelsHidden()
                            .padding(.leading, 5)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(.red)
                        Text(registerViewModel.agreedOnTermsErrorMessage)
                            .applyLabelStyle(style: .BodySmallRegular, color: .red)
                        Spacer()
                    }
                    .padding(.top, -5)
                    .opacity(registerViewModel.showAgreedOnTermsErrorMessage)
                    //                Spacer()
                    Button(action: {
                        Task {
                            try await registerViewModel.createUser()
                        }
                    }) {
                        Text("Register")
                            .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue50)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(formIsValid ? .blue500 : .blue200)
                            .cornerRadius(8)
                        
                    }
                    .disabled(!formIsValid)
                    HStack(spacing: 3) {
                        Spacer()
                        Text("Already have an account?")
                            .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                        Button(action: {
                            coordinator.push(.login)
                        }) {
                            Text("Login")
                                .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue500)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal, 16)
                
            }
            .onTapGesture {
                // Resign first responder status to close the keyboard
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .alert(registerViewModel.error?.name ?? "Error", isPresented: $registerViewModel.showAlert, presenting: registerViewModel.error) { details in
                Button("OK", role: .cancel) { }
            } message: { details in
                Text(details.error)
            }
            if registerViewModel.showLoading {
                ProgressView()
                    .tint(.blue500)
                    .scaleEffect(3)
            }
        }
        .onChange(of: registerViewModel.userSession, perform: { _ in
            sessionManager.userSession = registerViewModel.userSession
            sessionManager.currentUser = registerViewModel.currentUser
        })
    }
}

extension RegisterView {
    var formIsValid: Bool {
        return registerViewModel.isFullNameValid
        && registerViewModel.isEmailValid
        && registerViewModel.isUserPasswordValid
        && registerViewModel.isphoneNumberValid
        && registerViewModel.agreedOnTerms
    }
}

//#Preview {
//    RegisterView()
//}


