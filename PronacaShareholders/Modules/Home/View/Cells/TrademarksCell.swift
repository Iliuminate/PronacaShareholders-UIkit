//
//  TrademarksCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

protocol TrademarksCellDelegate: AnyObject {
    func selectedSection(indexPath: IndexPath)
}

class TrademarksCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: TrademarksCellDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
        addGestures()
    }
    
    // MARK: - Private properties -
    private func setUpStyle() {
        titleLabel.textColor = .black1
        titleLabel.font = UIFont(.MontserratSemiBold, .s14)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        print("CEDA: TrademarksCell-handleTap")
        delegate?.selectedSection(indexPath: index)
    }
    
    // MARK: - Public properties -
    func configure(with data: SectionItem, indexPath: IndexPath) {
        titleLabel.text = data.name
        imageView.image = UIImage(named: data.icon)
        index = indexPath
    }

}
