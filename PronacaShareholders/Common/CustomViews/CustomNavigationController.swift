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
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let height = CGFloat(75)
//        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
//        navigationBar.backgroundColor = .red
//    }
    
    private func setUpStyle() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
    
    func addSearchButton(_ context: UIViewController, _ action: Selector) {
        navigationItem.configureBarButton(
            imageName: "search",
            tintColor: .green2,
            target: context,
            selector: action,
            side: .left
        )
    }
}
