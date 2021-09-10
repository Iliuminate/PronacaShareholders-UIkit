//
//  FormAccountWireframe.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 9/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FormAccountWireframe: BaseWireframe<FormAccountViewController> {

    // MARK: - Module setup -

    init() {
        let moduleViewController = FormAccountViewController()
        super.init(viewController: moduleViewController)

        let interactor = FormAccountInteractor()
        let presenter = FormAccountPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension FormAccountWireframe: FormAccountWireframeInterface {
}