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
        case eg, AppLogoBlue500, AppLogoBlue400, AppLogoNeutrals400, AppLogoNeutrals500
        case Home, HomeFilled, Account, AccountFilled, Message, MessageFilled, Favorite, FavoriteFilled
        case bell, shieldDone
        
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


