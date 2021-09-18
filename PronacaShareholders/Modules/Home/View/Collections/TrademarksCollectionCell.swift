//
//  TrademarksCollectionCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 15/09/21.
//

import UIKit

class TrademarksCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var trademarksCollection: UICollectionView!
    
    private let spacingInterItem: CGFloat = 50
    private var trademarks: [SectionItem] = []
    
    weak var delegate: HomeSectionsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        trademarksCollection.delegate = self
        trademarksCollection.dataSource = self
        trademarksCollection.register(UINib(nibName: "\(TrademarksCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TrademarksCell.self)")
        trademarksCollection.register(
            UINib(nibName: "\(HomeHeaderReusableView.self)", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "\(HomeHeaderReusableView.self)"
        )
    }
    
    // MARK: - Public methods -
    func configure(with trademarks: [SectionItem]) {
        self.trademarks = trademarks
    }

}

extension TrademarksCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trademarks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TrademarksCell.self)", for: indexPath) as! TrademarksCell
        cell.delegate = self
        cell.configure(with: trademarks[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HomeHeaderReusableView.self)", for: indexPath) as? HomeHeaderReusableView else {
                return UICollectionReusableView()
            }
            headerView.configure(with: HeaderItem(title: "Marcas", buttonText: "", buttonIsHidden: true))
            return headerView
        case UICollectionView.elementKindSectionFooter:
            return UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}

extension TrademarksCollectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthItem = (collectionView.frame.width / 2.0) - spacingInterItem
        let heightItem = widthItem * 1.0
        return CGSize(width: widthItem, height: heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 25, bottom: 4, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacingInterItem * 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: HomeSections.sections.headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}

extension TrademarksCollectionCell: TrademarksCellDelegate {
    
    func selectedSection(indexPath: IndexPath) {
        delegate?.selectedHomeSection(type: .trademarks, indexPath: indexPath)
    }
}
