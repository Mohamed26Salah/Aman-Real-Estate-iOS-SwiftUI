//
//  AppFonts.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 09/12/2023.
//

import SwiftUI

extension Font {
    public enum SFProDisplay: String {
        case regular = "SFProDisplay-Regular"
        case medium = "SFProDisplay-Medium"
        case semibold = "SFProDisplay-Semibold"
        case bold = "SFProDisplay-Bold"
        
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
        case .Heading1: return .custom("SFProDisplay-Bold", size: 40)
        case .Heading2: return .custom("SFProDisplay-Bold", size: 32)
        case .Heading3: return .custom("SFProDisplay-Bold", size: 24)
        case .Heading4: return .custom("SFProDisplay-Bold", size: 20)
        case .Heading5: return .custom("SFProDisplay-Bold", size: 18)
        case .Heading6: return .custom("SFProDisplay-Bold", size: 16)
            
        case .BodyXLargeBold: return .custom("SFProDisplay-Bold", size: 18)
        case .BodyXLargeSemiBold: return .custom("SFProDisplay-Semibold", size: 18)
        case .BodyXLargeMedium: return .custom("SFProDisplay-Medium", size: 18)
        case .BodyXLargeRegular: return .custom("SFProDisplay-Regular", size: 18)
            
            
        case .BodyLargeBold: return .custom("SFProDisplay-Bold", size: 16)
        case .BodyLargeSemiBold: return .custom("SFProDisplay-SemiBold", size: 16)
        case .BodyLargeMedium: return .custom("SFProDisplay-Medium", size: 16)
        case .BodyLargeRegular: return .custom("SFProDisplay-Regular", size: 16)
            
        case .BodyMediumBold: return .custom("SFProDisplay-Bold", size: 14)
        case .BodyMediumSemiBold: return .custom("SFProDisplay-SemiBold", size: 14)
        case .BodyMediumMedium: return .custom("SFProDisplay-Medium", size: 14)
        case .BodyMediumRegular: return .custom("SFProDisplay-Regular", size: 14)
            
        case .BodySmallBold: return .custom("SFProDisplay-Bold", size: 12)
        case .BodySmallSemiBold: return .custom("SFProDisplay-SemiBold", size: 12)
        case .BodySmallMedium: return .custom("SFProDisplay-Medium", size: 12)
        case .BodySmallRegular: return .custom("SFProDisplay-Regular", size: 12)
            
        case .BodyXSmallBold: return .custom("SFProDisplay-Bold", size: 10)
        case .BodyXSmallSemiBold: return .custom("SFProDisplay-SemiBold", size: 10)
        case .BodyXSmallMedium: return .custom("SFProDisplay-Medium", size: 10)
        case .BodyXSmallRegular: return .custom("SFProDisplay-Regular", size: 10)
        }
    }

    var color: Color {
        switch self {
        default: return .black
        }
    }
}

extension Text {
    func applyLabelStyle(style: LabelStyle, text: String? = nil) -> Text {
        self
            .font(style.font)
            .foregroundColor(style.color)
    }
    
    func setUnderlinedText(_ text: String, font: Font, color: Color) -> Text {
        self
            .underline()
            .font(font)
            .foregroundColor(color)
    }
}

