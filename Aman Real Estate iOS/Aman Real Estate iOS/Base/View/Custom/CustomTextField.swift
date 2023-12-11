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
    @Binding var text: String
    @Binding var isTheirAnError: Bool
    @FocusState var isEnabled: Bool

    var body: some View {
        TextField(text: $text) {
            Text(hint)
                .applyLabelStyle(style: hintStyle, color: hintColor)
        }
        .focused($isEnabled)
        .keyboardType(keyboardType)
        .textContentType(keyboardContentType)
        .padding()
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isEnabled ? isTheirAnError ? Color.red : Color.blue : Color.clear)
        )
        .animation(.default, value: isEnabled)
        .animation(.default, value: isTheirAnError)
    }
}



