//
//  HomePromotionBottomReusableView.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 19/09/21.
//

import UIKit

protocol HomePromotionBottomReusableViewDelegate: AnyObject {
    func handleTapButton()
}

class HomePromotionBottomReusableView: UICollectionReusableView {

    @IBOutlet weak var showMoreButton: UIButton!
    weak var delegate: HomePromotionBottomReusableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        showMoreButton.greenButton()
    }
    
    @IBAction func showMoreButtonAction(_ sender: Any) {
        delegate?.handleTapButton()
    }
}
