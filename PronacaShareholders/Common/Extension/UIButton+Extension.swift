//
//  UIButton+Extension.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 12/09/21.
//

import UIKit

extension UIButton {
    
    func greenButton() {
        self.layer.cornerRadius = self.frame.height * 0.5
        self.layer.masksToBounds = true
        self.backgroundColor = .green1
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont(name: LocalFonts.MontserratMedium.rawValue, size: LocalFontSize.s18.rawValue)!
    }
    
    func redButton(font: UIFont) {
        self.setTitleColor(.red1, for: .normal)
        self.titleLabel?.font = font
    }
    
    /// UIFont(.MontserratRegular, .s12)
    func redButton1() {
        redButton(font: UIFont(name: LocalFonts.MontserratRegular.rawValue, size: LocalFontSize.s12.rawValue)!)
    }
    
    /// UIFont(.MontserratSemiBold, .s12)
    func redButton2() {
        redButton(font: UIFont(name: LocalFonts.MontserratSemiBold.rawValue, size: LocalFontSize.s12.rawValue)!)
    }
}
