//
//  CustomNavigationBar.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpStyle()
    }
    
    private func setUpStyle() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
    
    func configureBackBarButton() {
        navigationItem.configureBarButton(
            imageName: "backArrow",
            target: self,
            selector: #selector(backAction),
            side: .left
        )
    }
    
    @objc private func backAction() {
        print("CEDA: Is back action")
    }
}
