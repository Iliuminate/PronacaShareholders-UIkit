//
//  ShelfCollectionCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//

import UIKit


struct ShelfCollectionModel {
    let icon: UIImage
    let title: String
    let buttonText: String
    let products: [ProductItemModel]
}

protocol ShelfCollectionCellDelegate: AnyObject {
    func showMore(indexPath: IndexPath)
}

class ShelfCollectionCell: UICollectionViewCell {

    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var productsCollection: UICollectionView!
    
    weak var delegate: ShelfCollectionCellDelegate?
    var index: IndexPath?
    var products: [ProductItemModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        setUpStyle()
        addGestures()
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        productsCollection.delegate = self
        productsCollection.dataSource = self
        productsCollection.register(UINib(nibName: "\(ProductItemCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ProductItemCell.self)")
    }
    
    private func setUpStyle() {
        productsCollection.backgroundColor = .clear
        titleLabel.font = UIFont(.MontserratSemiBold, .s16)
        titleLabel.textColor = .black1
        showAllButton.greenButton3()
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        print("CEDA: ShelfCollectionCell-handleTap")
        delegate?.showMore(indexPath: index)
    }
    
    // MARK: - Public methods -
    func configure(with data: ShelfCollectionModel, indexPath: IndexPath){
        headerIcon.image = data.icon
        titleLabel.text = data.title
        showAllButton.setTitle("+ \(data.buttonText)", for: .normal)
        index = indexPath
        products = data.products
        productsCollection.reloadData()
    }
    
    @IBAction func showAllButtonAction(_ sender: Any) {
        print("CEDA: showAllButtonAction")
    }
    
}

extension ShelfCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductItemCell.self)", for: indexPath) as! ProductItemCell
        cell.configure(with: products[indexPath.row], indexPath: indexPath)
        return cell
    }
}


extension ShelfCollectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 110.0, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 1, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
