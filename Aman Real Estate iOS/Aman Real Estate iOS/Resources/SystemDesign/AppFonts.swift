//
//  AppFonts.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

extension Font {
    public enum SFProDisplay: String {
        case regular = "SF Pro Display Regular"
        case medium = "SF Pro Display Medium"
        case semibold = "SF Pro Display Semibold"
        case bold = "SF Pro Display Bold"
        
        public var name: String {
            return self.rawValue
        }
        
        public func size(_ size: CGFloat) -> Font {
            return .custom(self.name, size: size)
        }
    }
}

public enum LabelStyle {
    case Heading1
    case Heading2
    case Heading3
    case Heading4
    case Heading5
    case Heading6
    
    case BodyXLargeBold
    case BodyXLargeSemiBold
    case BodyXLargeMedium
    case BodyXLargeRegular
    
    case BodyLargeBold
    case BodyLargeSemiBold
    case BodyLargeMedium
    case BodyLargeRegular
    
    case BodyMediumBold
    case BodyMediumSemiBold
    case BodyMediumMedium
    case BodyMediumRegular
    
    case BodySmallBold
    case BodySmallSemiBold
    case BodySmallMedium
    case BodySmallRegular
    
    case BodyXSmallBold
    case BodyXSmallSemiBold
    case BodyXSmallMedium
    case BodyXSmallRegular
    

    var font: Font {
        switch self {
        case .Heading1: return .custom("SF Pro Display Bold", size: 40)
        case .Heading2: return .custom("SF Pro Display Bold", size: 32)
        case .Heading3: return .custom("SF Pro Display Bold", size: 24)
        case .Heading4: return .custom("SF Pro Display Bold", size: 20)
        case .Heading5: return .custom("SF Pro Display Bold", size: 18)
        case .Heading6: return .custom("SF Pro Display Bold", size: 16)
            
        case .BodyXLargeBold: return .custom("SF Pro Display Bold", size: 18)
        case .BodyXLargeSemiBold: return .custom("SF Pro Display Semibold", size: 18)
        case .BodyXLargeMedium: return .custom("SF Pro Display Medium", size: 18)
        case .BodyXLargeRegular: return .custom("SF Pro Display Regular", size: 18)
            
            
        case .BodyLargeBold: return .custom("SF Pro Display Bold", size: 16)
        case .BodyLargeSemiBold: return .custom("SF Pro Display Semibold", size: 16)
        case .BodyLargeMedium: return .custom("SF Pro Display Medium", size: 16)
        case .BodyLargeRegular: return .custom("SF Pro Display Regular", size: 16)
            
        case .BodyMediumBold: return .custom("SF Pro Display Bold", size: 14)
        case .BodyMediumSemiBold: return .custom("SF Pro Display Semibold", size: 14)
        case .BodyMediumMedium: return .custom("SF Pro Display Medium", size: 14)
        case .BodyMediumRegular: return .custom("SF Pro Display Regular", size: 14)
            
        case .BodySmallBold: return .custom("SF Pro Display Bold", size: 12)
        case .BodySmallSemiBold: return .custom("SF Pro Display Semibold", size: 12)
        case .BodySmallMedium: return .custom("SF Pro Display Medium", size: 12)
        case .BodySmallRegular: return .custom("SF Pro Display Regular", size: 12)
            
        case .BodyXSmallBold: return .custom("SF Pro Display Bold", size: 10)
        case .BodyXSmallSemiBold: return .custom("SF Pro Display Semibold", size: 10)
        case .BodyXSmallMedium: return .custom("SF Pro Display Medium", size: 10)
        case .BodyXSmallRegular: return .custom("SF Pro Display Regular", size: 10)
        }
    }

    var color: Color {
        switch self {
        default: return .black
        }
    }
}

extension Text {
    func applyLabelStyle(style: LabelStyle, text: String? = nil, color: Color = .black) -> Text {
        self
            .font(style.font)
            .foregroundColor(color)
    }
    
    func setUnderlinedText(_ text: String, font: Font, color: Color) -> Text {
        self
            .underline()
            .font(font)
            .foregroundColor(color)
    }
}

