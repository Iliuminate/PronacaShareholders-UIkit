//
//  PromotionsCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

protocol PromotionsCellDelegate: AnyObject {
    func selectedSection(indexPath: IndexPath)
}

class PromotionsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    
    weak var delegate: PromotionsCellDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
        addGestures()
    }
    
    // MARK: - Private methods -
    private func setUpStyle() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12.0
        imageView.layer.masksToBounds = true
        showMoreButton.greenButton()
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        print("CEDA: PromotionsCell-handleTap")
        delegate?.selectedSection(indexPath: index)
    }
    
    // MARK: - Public methods -
    func configure(with data: SectionItem, indexPath: IndexPath) {
        showMoreButton.setTitle(data.name, for: .normal)
        imageView.image = UIImage(named: data.icon)
        index = indexPath
    }
    
    
    @IBAction func showMoreButtonAction(_ sender: Any) {
        print("CEDA: PromotionCell-showMoreButtonAction ")
    }
}
