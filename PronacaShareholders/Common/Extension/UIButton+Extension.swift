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
    
    func greenButton2() {
        self.setTitleColor(.green1, for: .normal)
        self.titleLabel?.font = UIFont(name: LocalFonts.MontserratSemiBold.rawValue, size: LocalFontSize.s14.rawValue)!
        guard let text = self.titleLabel?.text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        self.titleLabel?.attributedText = attributedText
    }
    
    func greenButton3() {
        self.setTitleColor(.green2, for: .normal)
        self.titleLabel?.font = UIFont(name: LocalFonts.MontserratBold.rawValue, size: LocalFontSize.s12.rawValue)!
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
