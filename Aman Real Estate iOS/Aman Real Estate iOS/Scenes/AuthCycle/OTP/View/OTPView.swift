//
//  OTPView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/12/2023.
//

import SwiftUI

struct OTPView: View {
    @State var texttt: String = ""
    @State var enableResendCode: Bool = false
    @State private var remainingTime = 60
    @State private var timer: Timer? = nil
    @State var otpCode: String = ""
    
    var phoneNumber: String
    
    var body: some View {
        VStack {
            HStack {
                Text("VerificationCode")
                    .applyLabelStyle(style: .Heading3, color: .neutrals900)
                Spacer()
            }
            .padding(.bottom, 10)
            HStack {
                Text("We have send the code verification to")
                    .applyLabelStyle(style: .BodyLargeMedium, color: .neutrals600)
                Spacer()
            }
            .padding(.bottom, 1)
            HStack {
                Text(phoneNumber)
                    .applyLabelStyle(style: .BodyLargeMedium, color: .neutrals900)
                Spacer()
            }
            OTPTextField(numberOfFields: 6, textFieldWidth: 55, textFieldHeight: 55, textFieldCornerRadius: 8, textFieldBackgroundColor: .neutrals50, textFieldFocusedBorderColor: .blue500, textFieldBorderColor: .neutrals200, otp: $otpCode)
            HStack {
                Button(action: {
                    resetTimer()
                }, label: {
                    Text("Resend code again")
                        .applyLabelStyle(style: .BodyMediumRegular, color: enableResendCode ? .blue500 : .neutrals300)
                })
                .disabled(!enableResendCode)
                Spacer()
                Text(timeString(time: remainingTime))
                    .applyLabelStyle(style: .BodyMediumSemiBold, color: .neutrals900)
            }
            .padding(.bottom, 100)
            Button(action: {
                
            }) {
                Text("Verify")
                    .applyLabelStyle(style: .BodyLargeSemiBold, color: .blue50)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background((otpCode.count == 6) ? .blue500 : .blue100)
                    .cornerRadius(8)
                    
            }
            .disabled(!(otpCode.count == 6))
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            self.startTimer()
        })
        .onDisappear(perform: {
            self.stopTimer()
        })

    }
    func startTimer() {
        self.enableResendCode = false
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.enableResendCode = true
    }
    
    func resetTimer() {
        self.stopTimer()
        self.remainingTime = 60
        self.startTimer()
    }
    func timeString(time: Int) -> String {
          let minutes = Int(time) / 60 % 60
          let seconds = Int(time) % 60
          return String(format:"%02i:%02i", minutes, seconds)
      }
}

#Preview {
    OTPView(phoneNumber: "+20 01097262974")
}
