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

enum HomeSections: Int, CaseIterable {
    case sections = 0
    case trademarks = 1
    case promotionsHeader = 2
    case promotions = 3
    
    var size: CGSize {
        switch self {
        case .sections:
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: width * 0.50 + headerHeight)
        case .trademarks:
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: width * 1.28 + headerHeight)
        case .promotions:
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: width * 0.50 + headerHeight)
        case .promotionsHeader:
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: headerHeight)
        }
    }
    
    var headerHeight: CGFloat {
        switch self {
        case .sections: return 40.0
        case .trademarks: return 40.0
        case .promotionsHeader: return 40.0
        case .promotions: return 20.0
        }
    }
}

final class HomeViewController: UIViewController {

    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var locationField: CustomTextField!
    
    
    // MARK: - Public properties -
    var presenter: HomePresenterInterface!
    var sections: [SectionItem] = [
        SectionItem(icon: "meat-group", name: "Cárnicos"),
        SectionItem(icon: "fish-group", name: "Pescados y Mariscos"),
        SectionItem(icon: "sausages-group", name: "Embutidos"),
        SectionItem(icon: "freezer-group", name: "Refrigerados y congelados"),
        SectionItem(icon: "canned-group", name: "Listo para servir"),
        SectionItem(icon: "processed-group", name: "Salsas, aliños y conservas"),
        SectionItem(icon: "pets-group", name: "Mascotas"),
        SectionItem(icon: "plus", name: "Todas")
    ]
    
    var trademarks: [SectionItem] = [
        SectionItem(icon: "pollo", name: "Mr. POLLO"),
        SectionItem(icon: "chancho", name: "MR. CHANCHO"),
        SectionItem(icon: "pescado", name: "MR. FISH"),
        SectionItem(icon: "pavo", name: "MR. PAVO"),
        SectionItem(icon: "cook", name: "Mr. COOK"),
        SectionItem(icon: "huevos", name: "Mr. HUEVOS")
    ]
    

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.register(UINib(nibName: "\(SectionsCollectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SectionsCollectionCell.self)")
        mainCollection.register(UINib(nibName: "\(TrademarksCollectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TrademarksCollectionCell.self)")
        mainCollection.register(UINib(nibName: "\(PromotionsCollectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PromotionsCollectionCell.self)")
        mainCollection.register(UINib(nibName: "\(HomeHeaderCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeHeaderCell.self)")
    }
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let section = HomeSections(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch section {
        case HomeSections.sections:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SectionsCollectionCell.self)", for: indexPath) as! SectionsCollectionCell
            cell.configure(with: sections)
            return cell
        case HomeSections.trademarks:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TrademarksCollectionCell.self)", for: indexPath) as! TrademarksCollectionCell
            cell.configure(with: trademarks)
            return cell
        case HomeSections.promotionsHeader:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderCell.self)", for: indexPath) as! HomeHeaderCell
            cell.configure(with: HeaderItem(title: "Promociones", buttonText: "Ver más", buttonIsHidden: false))
            return cell
        case HomeSections.promotions:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PromotionsCollectionCell.self)", for: indexPath) as! PromotionsCollectionCell
            cell.configure(with: trademarks)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = HomeSections(rawValue: indexPath.section) else { return CGSize.zero }
        return section.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 25, bottom: 4, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
