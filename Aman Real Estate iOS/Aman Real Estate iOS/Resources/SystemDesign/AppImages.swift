//
//  AppImages.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//


import SwiftUI

extension SystemDesign {
    enum AppImages: String {
        case BackDoor, FrontDoor, SmallStar, BigStar
        case DoorKnob, SplashImage
        case FirstHouseOnBoarding, SecondHouseOnBoarding, ThirdHouseOnBoarding
        case eg
        
        //return name of image
        var name: String {
            self.rawValue
        }
        
        //return image
        var image: Image {
            Image(self.rawValue)
        }
    }
}


