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
    
    func configureBarButtonWithLabel(
        imageName: String = "",
        title: String = "",
        tintColor: UIColor = .white,
        backgroundColor: UIColor = .clear,
        backgroundShape: BarButtonBackgroundShape = .none,
        font: UIFont = UIFont(.MontserratSemiBold, .s18),
        target: Any,
        selector: Selector,
        side: BarButtonItemSide,
        size: CGFloat = 6.0
    ) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.imageEdgeInsets = UIEdgeInsets(top: size, left: size, bottom: size, right: size)
        
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = tintColor
        let contentView = UIStackView()
        contentView.axis = .horizontal
        contentView.addArrangedSubview(button)
        contentView.addArrangedSubview(label)
        
        switch side {
        case .right:
            button.contentHorizontalAlignment = .right
            button.semanticContentAttribute = .forceRightToLeft
            rightBarButtonItem = UIBarButtonItem(customView: contentView)
        case .left:
            button.contentHorizontalAlignment = .left
            button.semanticContentAttribute = .forceLeftToRight
            leftBarButtonItem = UIBarButtonItem(customView: contentView)
        }
    }
    
    func configureCartButton(
        tintColor: UIColor = .white,
        backgroundColor: UIColor = .clear,
        backgroundShape: BarButtonBackgroundShape = .none,
        font: UIFont = UIFont(.MontserratSemiBold, .s18),
        target: Any,
        selector: Selector,
        side: BarButtonItemSide,
        size: CGFloat = 6.0,
        requiredSearch: Bool = true
    ) {
        let image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        let searchButton = UIButton()
        searchButton.setImage(image, for: .normal)
        searchButton.addTarget(target, action: selector, for: .touchUpInside)
        searchButton.tintColor = tintColor
        searchButton.backgroundColor = backgroundColor
        searchButton.imageEdgeInsets = UIEdgeInsets(top: size, left: size, bottom: size, right: size)
        searchButton.isHidden = !requiredSearch
        
        let cartImage = UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate)
        let cartButton = UIButton()
        cartButton.setImage(cartImage, for: .normal)
        cartButton.addTarget(target, action: selector, for: .touchUpInside)
        cartButton.tintColor = tintColor
        cartButton.backgroundColor = backgroundColor
        cartButton.imageEdgeInsets = UIEdgeInsets(top: size, left: size, bottom: size, right: size)
        
        let separatorView = UIView()
        //separatorView.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        separatorView.backgroundColor = tintColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIStackView()
        contentView.axis = .horizontal
        contentView.addArrangedSubview(searchButton)
        contentView.addArrangedSubview(separatorView)
        contentView.addArrangedSubview(cartButton)
        
        let superView = contentView.subviews[1]
        separatorView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 4.0).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 4.0).isActive = true
        separatorView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        switch side {
        case .right:
            searchButton.contentHorizontalAlignment = .right
            searchButton.semanticContentAttribute = .forceRightToLeft
            cartButton.contentHorizontalAlignment = .right
            cartButton.semanticContentAttribute = .forceRightToLeft
            rightBarButtonItem = UIBarButtonItem(customView: contentView)
        case .left:
            searchButton.contentHorizontalAlignment = .left
            searchButton.semanticContentAttribute = .forceLeftToRight
            cartButton.contentHorizontalAlignment = .right
            cartButton.semanticContentAttribute = .forceRightToLeft
            leftBarButtonItem = UIBarButtonItem(customView: contentView)
        }
    }
}
