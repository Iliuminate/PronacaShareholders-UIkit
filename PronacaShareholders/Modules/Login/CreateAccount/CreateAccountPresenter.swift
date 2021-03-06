//
//  CreateAccountPresenter.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 9/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class CreateAccountPresenter {

    // MARK: - Private properties -

    private unowned let view: CreateAccountViewInterface
    private let interactor: CreateAccountInteractorInterface
    private let wireframe: CreateAccountWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: CreateAccountViewInterface,
        interactor: CreateAccountInteractorInterface,
        wireframe: CreateAccountWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension CreateAccountPresenter: CreateAccountPresenterInterface {
}
