//
//  LoginMainViewController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 9/09/21.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginMainViewController: UIViewController {
    
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public properties -
    var presenter: LoginMainPresenterInterface!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addGestureRecognizer()
        setUpFields()
        setUpScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setUpStyles()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Private methods -
    
    private func setUpView() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    private func setUpFields() {
        emailField.setLeftImage("mail")
        passwordField.setLeftImage("security")
        passwordField.isSecureTextEntry = true
    }
    
    private func setUpScrollView() {
        scrollView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setUpStyles() {
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 24.0)!
        titleLabel.textColor = .black1
        descriptionLabel.font = UIFont(.MontserratRegular, .s12)
        descriptionLabel.textColor = .black1
        loginButton.greenButton()
        createAccount.redButton1()
        forgotPassword.redButton2()
    }
    
    private func addLeftView(field: UITextField, imageName: String, size: CGSize = CGSize(width: 5, height: 5)) {
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        icon.image = UIImage(named: imageName)
        icon.contentMode = .scaleToFill
        field.leftView = icon
        field.leftViewMode = .always
    }
    
    private func addGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDidTouch(sender: )))
        view.addGestureRecognizer(tapRecognizer)
        scrollView.addGestureRecognizer(tapRecognizer)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let navigation = navigationController else { return }
        navigation.pushWireframe(CreateAccountWireframe())
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        guard let navigation = navigationController else { return }
        navigation.pushWireframe(FormAccountWireframe())
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        guard let navigation = navigationController else { return }
    }
    
}

// MARK: - Extensions -
extension LoginMainViewController: LoginMainViewInterface { }

extension LoginMainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

extension LoginMainViewController: UIScrollViewDelegate {
    
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
