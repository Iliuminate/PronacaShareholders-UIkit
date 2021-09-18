//
//  ShelfCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//

import UIKit

struct ShelfCellModel {
    let title: String
    let color: UIColor
    var isSelected: Bool = false
}

protocol ShelfCellDelegate: AnyObject {
    func selectedShelf(indexPath: IndexPath)
}

class ShelfCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomIndicatorView: UIView!
    
    var index: IndexPath?
    weak var delegate: ShelfCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
        addGestures()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bottomIndicatorView.isHidden = true
    }

    // MARK: - Private methods -
    private func setUpStyle() {
        titleLabel.font = UIFont(.MontserratSemiBold, .s14)
        titleLabel.textColor = .black1
        bottomIndicatorView.backgroundColor = .green1
        bottomIndicatorView.isHidden = true
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        bottomIndicatorView.isHidden = false
        print("CEDA: SectionsCell-handleTap")
        delegate?.selectedShelf(indexPath: index)
    }
    
    // MARK: - Public methods -
    func configure(with data: ShelfCellModel, indexPath: IndexPath) {
        titleLabel.text = data.title
        bottomIndicatorView.isHidden = !data.isSelected
        index = indexPath
    }
}
