//
//  CreateAccountViewController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 9/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CreateAccountViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - Public properties -
    var presenter: CreateAccountPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackButton()
        setUpStyles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setUpStyles() {
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 24.0)!
        titleLabel.textColor = .black1
        descriptionLabel.font = UIFont(.MontserratRegular, .s12)
        descriptionLabel.textColor = .black1
        sendButton.greenButton()
    }
    
    private func configureBackButton() {
        navigationItem.configureBarButton(
            imageName: "backArrow",
            tintColor: .green2,
            target: self,
            selector: #selector(backAction),
            side: .left
        )
    }
    
    @objc func backAction() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        guard let navigation = navigationController else { return }
        navigation.pushWireframe(VerificationCodeWireframe())
    }
    
    
}

// MARK: - Extensions -

extension CreateAccountViewController: CreateAccountViewInterface {
}
