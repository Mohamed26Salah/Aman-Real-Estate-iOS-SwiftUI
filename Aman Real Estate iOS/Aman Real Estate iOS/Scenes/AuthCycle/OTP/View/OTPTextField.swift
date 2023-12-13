//
//  OTPTextField.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/12/2023.
//

import SwiftUI
import Combine

struct OTPTextField: View {
    let numberOfFields: Int
    var textFieldWidth: CGFloat
    var textFieldHeight: CGFloat
    var textFieldCornerRadius: CGFloat
    var textFieldBackgroundColor: Color
    var textFieldBorderColor: Color
    var textFieldFocusedBorderColor: Color
    
    @State var enterValue: [String]
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""
    @Binding var otp: String
    
    init(numberOfFields: Int, textFieldWidth: CGFloat, textFieldHeight: CGFloat, textFieldCornerRadius: CGFloat, textFieldBackgroundColor: Color, textFieldFocusedBorderColor: Color, textFieldBorderColor: Color, oldValue: String = "", otp: Binding<String>) {
        self.numberOfFields = numberOfFields
        self.textFieldWidth = textFieldWidth
        self.textFieldHeight = textFieldHeight
        self.textFieldCornerRadius = textFieldCornerRadius
        self.textFieldBackgroundColor = textFieldBackgroundColor
        self.textFieldBorderColor = textFieldBorderColor
        self.textFieldFocusedBorderColor = textFieldFocusedBorderColor
        self.enterValue = Array(repeating: "", count: numberOfFields)
        self.oldValue = oldValue
        self._otp = otp
    }
    var body: some View {
        HStack {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index]) { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                }
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(width: textFieldWidth, height: textFieldHeight)
                .background(textFieldBackgroundColor)
                .cornerRadius(textFieldCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: textFieldCornerRadius)
                        .stroke(fieldFocus == index ? textFieldFocusedBorderColor : textFieldBorderColor, lineWidth: 1)
                )
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enterValue[index], perform: { newvalue in
                    if enterValue[index].count > 1 {
                        let currentValue = Array(enterValue[index])
                        if currentValue[0] == Character(oldValue) {
                            enterValue[index] = String(enterValue[index].suffix(1))
                        } else {
                            enterValue[index] = String(enterValue[index].prefix(1))
                        }
                    }
                    if !newvalue.isEmpty {
                        if index == numberOfFields - 1 {
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                    otp = enterValue.joined()
                })
            }
        }
    }
}


#Preview {
    OTPTextField(numberOfFields: 6, textFieldWidth: 48, textFieldHeight: 48, textFieldCornerRadius: 5, textFieldBackgroundColor: .gray, textFieldFocusedBorderColor: .red, textFieldBorderColor: .black, otp: .constant(""))
}
