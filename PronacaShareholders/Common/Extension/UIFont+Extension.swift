//
//  UIFont+Extension.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 12/09/21.
//

import UIKit

extension UIFont {
    
    func getFont(fontName: String) -> UIFont {
        guard let customFont = UIFont(name: fontName, size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    enum LocalFonts: String {
        case CenturyGothic
        case MontserratBold = "Montserrat-Bold"
        case MontserratMedium = "Montserrat-Medium"
        case MontserratRegular = "Montserrat-Regular"
        case MontserratSemiBold = "Montserrat-SemiBold"
        case OpenSansBold = "OpenSans-Bold"
        case OpenSansRegular = "OpenSans-Regular"
        case RalewayLight = "Raleway-Light"
        case RobotoMedium = "Roboto-Medium"
    }
    
    enum LocalFontSize: CGFloat {
        case s12 = 12.0
        case s14 = 14.0
        case s16 = 16.0
        case s18 = 18.0
        case s21 = 21.0
        case s24 = 24.0
    }
    
    convenience init(_ font: LocalFonts, _ size: LocalFontSize) {
        self.init(name: font.rawValue, size: size.rawValue)!
    }
}
