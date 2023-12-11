//
//  RegisterView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 11/12/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var emailBorderError: Bool = false
    @State var isFormValidated: Bool = false
    @State var aggreedOnTerms: Bool = false
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Sign Up")
                    .applyLabelStyle(style: .Heading3, color: .neutrals900)
                
                Spacer()
            }
            HStack {
                Text("Full Name")
                    .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals900)
                Spacer()
            }
            .padding(.top, 8)
            HStack() {
                CustomTextField(
                    keyboardContentType: .name,
                    keyboardType: .default,
                    hint: "Enter Full Name",
                    hintStyle: .BodyMediumRegular,
                    hintColor: .neutrals600,
                    backgroundColor: SystemDesign.AppColors.Neutrals100.color,
                    cornerRadius: 8,
                    text: $email,
                    isTheirAnError: $emailBorderError)
            }
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
                    hint: "Email",
                    hintStyle: .BodyMediumRegular,
                    hintColor: .neutrals600,
                    backgroundColor: SystemDesign.AppColors.Neutrals100.color,
                    cornerRadius: 8,
                    text: $email,
                    isTheirAnError: $emailBorderError)
            }
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
                Toggle("", isOn: $aggreedOnTerms)
                    .toggleStyle(SwitchToggleStyle(tint: SystemDesign.AppColors.Blue500.color))
                    .labelsHidden()
                    .padding(.leading, 5)
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("Register")
                    .applyLabelStyle(style: .BodyMediumSemiBold, color: .blue50)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isFormValidated ? SystemDesign.AppColors.Blue500.color : SystemDesign.AppColors.Blue200.color)
                    .cornerRadius(8)
                
            }
            HStack(spacing: 3) {
                Spacer()
                Text("Already have an account?")
                    .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                Button(action: {
                    
                }) {
                    Text("Login")
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

#Preview {
    RegisterView()
}


