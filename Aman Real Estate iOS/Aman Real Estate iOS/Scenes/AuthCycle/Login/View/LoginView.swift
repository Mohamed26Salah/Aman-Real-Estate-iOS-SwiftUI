//
//  LoginView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 10/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var emailBorderError: Bool = false
    @State var isFormValidated: Bool = false
    @State var countryCode: String = ""

    @EnvironmentObject private var coordinator: AuthCoordinator
    @StateObject var loginViewModel: LoginViewModel
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Let's Login")
                    .applyLabelStyle(style: .Heading3, color: .neutrals900)
                    
                Spacer()
            }
            Image(SystemDesign.AppImages.AppLogoBlue500.name)
                .resizable()
                .frame(width: 300, height: 300)
//                .padding(.vertical, -20)
            HStack {
                Text("Phone Number")
                    .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                Spacer()
            }
            .padding(.top, 8)
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
                    backgroundColor: SystemDesign.AppColors.Neutrals100.color,
                    cornerRadius: 8,
                    text: $email,
                    isTheirAnError: $emailBorderError)
            }

            Spacer()
            Button(action: {
                
            }) {
                Text("Login")
                    .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue50)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isFormValidated ? SystemDesign.AppColors.Blue500.color : SystemDesign.AppColors.Blue200.color)
                    .cornerRadius(8)
                    
            }
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
       
    }
}

//#Preview {
//    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
//
//    LoginView(loginViewModel: loginViewModel)
//}
