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


class ProductItemCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with data: ProductItemModel, indexPath: IndexPath) {
        
    }
}
