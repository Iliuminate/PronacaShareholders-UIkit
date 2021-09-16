//
//  PromotionsCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

class PromotionsCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
    }
    
    private func setUpStyle() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12.0
        imageView.layer.masksToBounds = true
        showMoreButton.greenButton()
    }
    
    func configure(with data: SectionItem) {
        showMoreButton.setTitle(data.name, for: .normal)
        imageView.image = UIImage(named: data.icon)
    }
    
    
    @IBAction func showMoreButtonAction(_ sender: Any) {
    }
}
