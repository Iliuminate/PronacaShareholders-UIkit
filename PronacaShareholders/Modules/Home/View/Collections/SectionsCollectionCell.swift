//
//  SectionsCollectionCell.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 15/09/21.
//

import UIKit

class SectionsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var sectionsCollection: UICollectionView!
    
    private var sections: [SectionItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        sectionsCollection.delegate = self
        sectionsCollection.dataSource = self
        sectionsCollection.register(UINib(nibName: "\(SectionsCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SectionsCell.self)")
    }
    
    // MARK: - Public methods -
    func configure(with sections: [SectionItem]) {
        self.sections = sections
    }
}

extension SectionsCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SectionsCell.self)", for: indexPath) as! SectionsCell
        cell.configure(with: sections[indexPath.row])
        return cell
    }
}

extension SectionsCollectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthItem = (collectionView.frame.width / 4.0) - 25
        let heightItem = widthItem * 1.25
        return CGSize(width: widthItem, height: heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 25, bottom: 4, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
