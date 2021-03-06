//
//  CartViewController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CartViewController: UIViewController {
    
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var productsTableView: UITableView!
    
    let productsInCart: [ProductItemModel] = []
    
    // MARK: - Public properties -
    var presenter: CartPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureBackButton()
    }
    
    private func setUpView() {
        cleanButton.greenButton2()
        confirmButton.greenButton()
    }

    private func configureBackButton() {
        navigationItem.configureBarButtonWithLabel(
            imageName: "backArrow",
            title: "Tienda",
            tintColor: .black1,
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
}

// MARK: - Extensions -

extension CartViewController: CartViewInterface {
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

