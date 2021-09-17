//
//  HomeHeaderCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 16/09/21.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        titleLabel.textColor = .green1
        titleLabel.font = UIFont(.MontserratBold, .s21)
        showMoreButton.greenButton2()
    }
    
    func configure(with data: HeaderItem) {
        titleLabel.text = data.title
        showMoreButton.setTitle(data.buttonText, for: .normal)
        showMoreButton.isHidden = data.buttonIsHidden
    }

    @IBAction func showMoreButtonAction(_ sender: Any) {
    }
    
}
