//
//  SectionsCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

class SectionsCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
    }
    
    private func setUpStyle() {
        titleLable.textColor = .black1
        titleLable.font = UIFont(.MontserratSemiBold, .s12)
        icon.contentMode = .scaleAspectFit
    }
    
    func configure(with data: SectionItem) {
        titleLable.text = data.name
        icon.image = UIImage(named: data.icon)
    }

}
