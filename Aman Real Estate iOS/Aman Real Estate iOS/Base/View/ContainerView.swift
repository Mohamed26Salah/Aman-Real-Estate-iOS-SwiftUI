//
//  ContainerView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenPresented: Bool = true
    @State private var isOnBoardingViewPresented: Bool = true
    private var shouldShowOnboarding: Bool {
            UserDefaults.standard.object(forKey: StorageKeys.UserDefaults.showOnboardingScreen) == nil && isOnBoardingViewPresented
        }

    var body: some View {
        if !isSplashScreenPresented {
            if shouldShowOnboarding {
                OnBoardingView(isPresented: $isOnBoardingViewPresented)
            } else {
                ContentView()
            }
            
        } else {
            SplashScreenAnimated(isPresented: $isSplashScreenPresented)
        }
    }
}

#Preview {
    ContainerView()
}

//if !isSplashScreenPresented {
//    if UserDefaults.standard.object(forKey: StorageKeys.UserDefaults.showOnboardingScreen) == nil{
//        if isOnBoardingViewPresented {
//            OnBoardingView(isPresented: $isOnBoardingViewPresented)
//        } else {
//            ContentView()
//        }
//    } else {
//        ContentView()
//    }
