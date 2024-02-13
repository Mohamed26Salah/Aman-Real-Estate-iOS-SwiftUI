//
//  AppColors.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

extension SystemDesign {
    enum AppColors: String {
        case Blue50, Blue100
        case Blue200, Blue300
        case Blue400, Blue500
        case Blue600, Blue700
        case Blue800, Blue900
        
        case Orange50, Orange100
        case Orange200, Orange300
        case Orange400, Orange500
        case Orange600, Orange700
        case Orange800, Orange900
        
        case Neutrals50, Neutrals100
        case Neutrals200, Neutrals300
        case Neutrals400, Neutrals500
        case Neutrals600, Neutrals700
        case Neutrals800, Neutrals900
        
        case Green, Red, Yellow
        
        var color: Color {
            return Color(self.rawValue)
        }
        var uiColor: UIColor {
            return UIColor(named: self.rawValue) ?? UIColor.systemBackground // Set default color here
        }
    }
}
