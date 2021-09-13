//
//  UITextField+Extension.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 12/09/21.
//

import UIKit


extension UITextField {
    
    func addLeftImage(imageName: String, size: CGSize = CGSize(width: 10.0, height: 10.0)) {
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        icon.image = UIImage(named: imageName)
        icon.contentMode = .scaleAspectFit
        self.leftView = icon
        self.leftViewMode = .always
    }
}
