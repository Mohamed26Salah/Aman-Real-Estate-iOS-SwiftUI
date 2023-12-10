//
//  SplashScreenAnimated.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

struct SplashScreenAnimated: View {
    @State private var isRotated = false
    @State private var starsOpacity = 1.0
    @State private var opacity = 1.0
    @State private var scale: CGSize = CGSize(width: 1.0, height: 1.0)
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Image(SystemDesign.AppImages.BackDoor.name)
                .scaleEffect(scale)
            
            ZStack {
                Image(SystemDesign.AppImages.FrontDoor.name)
                    .offset(x: 9.5, y: 9.5)
                    .shadow(color: .gray, radius: 10, x: 0, y: 10)

                Image(SystemDesign.AppImages.DoorKnob.name)
                    .offset(x: -20, y: 10)
            }
            .rotation3DEffect(
                .degrees(isRotated ? 90 : 0),
                axis: (x: 0, y: 1, z: 0),
                anchor: .trailing
            )
            .opacity(starsOpacity)
            
            Group {
                Image(SystemDesign.AppImages.SmallStar.name)
                    .offset(x: 67, y: -20)
                Image(SystemDesign.AppImages.BigStar.name)
                    .offset(x: 47, y: -70)
            }
            .opacity(starsOpacity)
            
        }
        .opacity(opacity)
        .onAppear {
            print(UIFont.familyNames)
            withAnimation(.easeInOut(duration: 0.8)) {
                isRotated = true
                starsOpacity = 0.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.8, execute: {
                withAnimation(.easeInOut(duration: 0.7)) {
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0.0
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now()+1.1, execute: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPresented = false
                }
            })
        }
    }
}

#Preview {
    SplashScreenAnimated(isPresented: .constant(true))
}
