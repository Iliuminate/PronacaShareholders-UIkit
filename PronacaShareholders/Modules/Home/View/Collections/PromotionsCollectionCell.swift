//
//  PromotionsCollectionCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 15/09/21.
//

import UIKit

class PromotionsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var prootionsCollection: UICollectionView!
    
    private let spacingInterItem: CGFloat = 12.0
    private var promotions: [SectionItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        prootionsCollection.delegate = self
        prootionsCollection.dataSource = self
        prootionsCollection.register(UINib(nibName: "\(PromotionsCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PromotionsCell.self)")
    }
    
    // MARK: - Public methods -
    func configure(with promotions: [SectionItem]) {
        self.promotions = promotions
    }
}

extension PromotionsCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PromotionsCell.self)", for: indexPath) as! PromotionsCell
        cell.configure(with: promotions[indexPath.row])
        return cell
    }
}

extension PromotionsCollectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthItem = (collectionView.frame.width / 1.35)
        let heightItem = widthItem * 0.60
        return CGSize(width: widthItem, height: heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 25, bottom: 4, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingInterItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacingInterItem
    }
}

