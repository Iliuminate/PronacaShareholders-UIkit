//
//  HomeViewController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Public properties -

    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}
