//
//  CartPresenter.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class CartPresenter {

    // MARK: - Private properties -

    private unowned let view: CartViewInterface
    private let interactor: CartInteractorInterface
    private let wireframe: CartWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: CartViewInterface,
        interactor: CartInteractorInterface,
        wireframe: CartWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension CartPresenter: CartPresenterInterface {
}
