//
//  ProductItemCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//

import UIKit

struct ProductItemModel {
    let icon: UIImage
    let title: String
    let amount: String
    let numberOfProducts: Int
}

protocol ProductItemDelegate: AnyObject {
    func selectedProduct(indexPath: IndexPath)
}

class ProductItemCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var contentViewCell: UIView!
    
    weak var delegate: ProductItemDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        setUpStyle()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        amountLabel.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addOutline()
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        icon.contentMode = .scaleAspectFit
    }
    
    private func setUpStyle() {
        titleLabel.font = UIFont(.MontserratRegular, .s10)
        amountLabel.font = UIFont(.MontserratSemiBold, .s12)
        promotionLabel.font = UIFont(.MontserratRegular, .s8)
        titleLabel.textColor = .black1
        amountLabel.textColor = .black1
        promotionLabel.textColor = .red1
    }
    
    private func addOutline() {
        contentViewCell.layer.masksToBounds = true
        contentViewCell.layer.borderWidth = 1.0
        contentViewCell.layer.borderColor = UIColor.black3.cgColor
        contentViewCell.layer.cornerRadius = 8.0
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        delegate?.selectedProduct(indexPath: index)
    }
    
    // MARK: - Public methods -
    func configure(with data: ProductItemModel, indexPath: IndexPath) {
        icon.image = data.icon
        titleLabel.text = data.title
        amountLabel.text = data.amount
        index = indexPath
    }
}
