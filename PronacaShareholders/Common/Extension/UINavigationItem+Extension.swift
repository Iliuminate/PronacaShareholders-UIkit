//
//  UINavigationItem+Extension.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

enum BarButtonItemSide {
    case left
    case right
}

enum BarButtonBackgroundShape {
    case circle
    case none
    case square
    case squareWith(cornerRadius: CGFloat)
    case oval
}

extension UINavigationItem {
    
    var navigationBarHeight: CGFloat {
        return UIApplication.shared.keyWindow?.rootViewController?.navigationController?.navigationBar.frame.height ?? 44
    }
    
    var navigationBarWidth: CGFloat {
        return UIApplication.shared.keyWindow?.rootViewController?.navigationController?.navigationBar.frame.width ?? UIScreen.main.bounds.width
    }
    
    func configureBarButton(
        imageName: String = "",
        title: String = "",
        tintColor: UIColor = .white,
        backgroundColor: UIColor = .clear,
        backgroundShape: BarButtonBackgroundShape = .none,
        font: UIFont = UIFont(.MontserratRegular, .s18),
        target: Any,
        selector: Selector,
        side: BarButtonItemSide,
        size: CGFloat = 6.0
    ) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(tintColor, for: .normal)
        button.titleLabel?.font = font
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.imageEdgeInsets = UIEdgeInsets(top: size, left: size, bottom: size, right: size)
                
        switch side {
        case .right:
            button.contentHorizontalAlignment = .right
            button.semanticContentAttribute = .forceRightToLeft
            rightBarButtonItem = UIBarButtonItem(customView: button)
        case .left:
            button.contentHorizontalAlignment = .left
            button.semanticContentAttribute = .forceLeftToRight
            leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
