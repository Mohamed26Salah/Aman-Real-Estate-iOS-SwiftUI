//
//  CustomTextField.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 10/12/2023.
//

import SwiftUI


struct CustomTextField: View {
    var keyboardContentType: UITextContentType
    var keyboardType: UIKeyboardType
    var hint: String
    var hintStyle: LabelStyle
    var hintColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var isSecureField: Bool
    var height: CGFloat
    @Binding var text: String
    @Binding var isTextFieldValid: Bool
    @FocusState var isEnabled: Bool
    @State var showPassword: Bool = false

    var body: some View {
        HStack {
            Group {
                if isSecureField && !showPassword {
                    SecureField(hint, text: $text)
                } else {
                    TextField(hint, text: $text)
                }
            }
            .frame(height: height)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .keyboardType(keyboardType)
            .textContentType(keyboardContentType)
            .focused($isEnabled)
            .padding()
            
            if isSecureField {
                Button(action: {
                    showPassword.toggle()
                }, label: {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .tint(.neutrals900)
                })
                .padding(.horizontal, 15)
            }
        }
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isEnabled ? !isTextFieldValid ? Color.red : Color.blue : Color.clear)
        )
        .animation(.smooth.speed(3.0), value: isEnabled)
        .animation(.smooth.speed(3.0), value: !isTextFieldValid)
    }
}

#Preview {
    CustomTextField(
        keyboardContentType: .name,
        keyboardType: .default,
        hint: "Enter Password",
        hintStyle: .BodyMediumRegular,
        hintColor: .neutrals600,
        backgroundColor: SystemDesign.AppColors.Neutrals100.color,
        cornerRadius: 8,
        isSecureField: true,
        height: 35,
        text: .constant(""),
        isTextFieldValid: .constant(false)
       
    )
}

