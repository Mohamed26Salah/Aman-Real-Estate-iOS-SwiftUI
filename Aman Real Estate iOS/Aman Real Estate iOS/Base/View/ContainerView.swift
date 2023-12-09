//
//  ContainerView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenPresented: Bool = true
    var body: some View {
        if !isSplashScreenPresented {
            ContentView()
        } else {
            SplashScreenAnimated(isPresented: $isSplashScreenPresented)
        }
    }
}

#Preview {
    ContainerView()
}
