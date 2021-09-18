//
//  SectionsCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 13/09/21.
//

import UIKit

protocol SectionsCellDelegate: AnyObject {
    func selectedSection(indexPath: IndexPath)
}


class SectionsCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    weak var delegate: SectionsCellDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
        addGestures()
    }
    
    // MARK: - Private methods -
    private func setUpStyle() {
        titleLable.textColor = .black1
        titleLable.font = UIFont(.MontserratSemiBold, .s12)
        icon.contentMode = .scaleAspectFit
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        print("CEDA: SectionsCell-handleTap")
        delegate?.selectedSection(indexPath: index)
    }
    
    // MARK: - Public methods -
    func configure(with data: SectionItem, indexPath: IndexPath) {
        titleLable.text = data.name
        icon.image = UIImage(named: data.icon)
        index = indexPath
    }

}
