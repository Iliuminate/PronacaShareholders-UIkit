//
//  FormAccountViewController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 9/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FormAccountViewController: UIViewController {

    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var confirmPassField: UITextField!
    @IBOutlet weak var idNumberField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var termButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public properties -
    var presenter: FormAccountPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addGestureRecognizer()
        configureBackButton()
        setUpStyles()
    }
    
    private func setUpView() {
        confirmPassField.delegate = self
        idNumberField.delegate = self
        mailField.delegate = self
        nameField.delegate = self
        passwordField.delegate = self
        phoneField.delegate = self
    }
    
    private func setUpStyles() {
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 24.0)!
        titleLabel.textColor = .black1
        descriptionLabel.font = UIFont(.MontserratRegular, .s16)
        descriptionLabel.textColor = .black1
        saveButton.greenButton()
        termButton.greenButton2()
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
    
    private func addGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDidTouch(sender: )))
        view.addGestureRecognizer(tapRecognizer)
        scrollView.addGestureRecognizer(tapRecognizer)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: .curveLinear,
            animations: {},
            completion: { _ in
                self.view.window?.rootViewController = HomeViewController()
            }
        )
        
    }
    
}

// MARK: - Extensions -

extension FormAccountViewController: FormAccountViewInterface {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

extension FormAccountViewController: UIScrollViewDelegate {
    
    @objc func tapDidTouch(sender: Any) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notif: Notification) {
        guard let frame = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: frame.height, right: 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }

    @objc func keyboardWillHide(notif: Notification) {
        scrollView.contentInset = UIEdgeInsets()
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension FormAccountViewController: UITextFieldDelegate {
    
}
