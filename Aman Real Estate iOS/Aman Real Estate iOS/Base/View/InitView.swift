//
//  ContainerView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

struct InitView: View {
    @State private var isSplashScreenPresented: Bool = true
    @State private var isOnBoardingViewPresented: Bool = true
    @StateObject var sessionManager = SessionManager()

    private var shouldShowOnboarding: Bool {
            UserDefaults.standard.object(forKey: StorageKeys.UserDefaults.showOnboardingScreen) == nil && isOnBoardingViewPresented
        }

    var body: some View {
        if !isSplashScreenPresented {
            if shouldShowOnboarding {
                OnBoardingView(isPresented: $isOnBoardingViewPresented)
            } else {
                if sessionManager.userSession != nil {
//                    Test()
                    NavigationBarView()
                        .environmentObject(sessionManager)
                } else {
                    AuthCoordinatorView()
                        .environmentObject(sessionManager)
                }
            }
            
        } else {
            SplashScreenAnimated(isPresented: $isSplashScreenPresented)
        }
    }
}

#Preview {
    InitView()
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
