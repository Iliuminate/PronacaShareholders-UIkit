//
//  TrademarksCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

class TrademarksCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
    }
    
    private func setUpStyle() {
        titleLabel.textColor = .black1
        titleLabel.font = UIFont(.MontserratSemiBold, .s14)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
    }
    
    func configure(with data: SectionItem) {
        titleLabel.text = data.name
        imageView.image = UIImage(named: data.icon)
    }

}
