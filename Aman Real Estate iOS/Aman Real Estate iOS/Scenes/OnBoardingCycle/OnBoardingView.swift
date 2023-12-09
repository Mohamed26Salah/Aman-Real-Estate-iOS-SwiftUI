//
//  OnBoarding.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isFlattenedFirstCircle: Bool = true
    @State private var isFlattenedSecondCircle: Bool = false
    @State private var isFlattenedThirdCircle: Bool = false
    @State private var currentPageNum = 0
    @Binding var isPresented: Bool
    
    var firstTextArray: [String] =
    ["#1 Best Real Estate App in The World", "There Are Various Types of Houses are Here", "Find Your Dream House Easily And Quickly"]
    
    var secondTextArray: [String] = ["Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.", "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.", "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."]
    var imagesArray: [String] = [SystemDesign.AppImages.FirstHouseOnBoarding.name, SystemDesign.AppImages.SecondHouseOnBoarding.name, SystemDesign.AppImages.ThirdHouseOnBoarding.name]
    
    var body: some View {
        VStack(spacing: 40) {
            Image(imagesArray[currentPageNum%3])
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 290, height: 369)
            .cornerRadius(500, corners: [.topLeft, .topRight])
            
            VStack(spacing: 16) {
                Group {
                    Text(firstTextArray[currentPageNum%3])
                        .applyLabelStyle(style: .Heading3, color: .black)
                        .multilineTextAlignment(.center)
                    Text(secondTextArray[currentPageNum%3])
                        .applyLabelStyle(style: .BodyMediumRegular, color: SystemDesign.AppColors.Neutrals600.color)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 16)
            }
//            .padding(.top, 40)
            
            HStack {
                RoundedSquare(width: 8, height: 8, isFlattened: $isFlattenedFirstCircle)
                RoundedSquare(width: 8, height: 8, isFlattened: $isFlattenedSecondCircle)
                RoundedSquare(width: 8, height: 8, isFlattened: $isFlattenedThirdCircle)
            }
            
            VStack {
                Button(action: {
                    withAnimation {
                        self.currentPageNum += 1
                    }
                }) {
                    Text(currentPageNum == 2 ? "Get Started" : "Next")
                        .padding()
                        .frame(width: 343)
                        .background(SystemDesign.AppColors.Blue500.color)
                        .foregroundColor(SystemDesign.AppColors.Neutrals50.color)
                        .cornerRadius(8)
                        
                }
            }
        }
        .onChange(of: currentPageNum, perform: { value in
            withAnimation {
                if value == 1 {
                    isFlattenedFirstCircle = false
                    isFlattenedSecondCircle = true
                } else if value == 2 {
                    isFlattenedSecondCircle = false
                    isFlattenedThirdCircle = true
                } else {
                    UserDefaults.standard.set(true, forKey: StorageKeys.UserDefaults.showOnboardingScreen)
                    isPresented = false
                }
            }
        })
    }
}

//#Preview {
//    OnBoardingView()
//}


struct RoundedSquare: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var isFlattened: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(isFlattened ? SystemDesign.AppColors.Blue500.color : SystemDesign.AppColors.Neutrals300.color)
            .frame(width: isFlattened ? width * 3 : width, height: height)
    }
}


