//
//  CarouselTableCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 21/07/2021.
//

import UIKit

class CarouselTableCell: UITableViewCell {
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    var arrayToShow: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = ColorHelper.brightestColor()
        collectionView.backgroundColor = ColorHelper.brightestColor()
        titleLabel.textColor = ColorHelper.darkestColor()
    }
    
    func configureWithArray(array: [String], title: String) {
        titleLabel.text = title+"(\(array.count))"
        arrayToShow = array
    }
}

extension CarouselTableCell: UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionCell",
                                 for: indexPath)
            as? CarouselCollectionCell {
            cell.configure(withString: arrayToShow[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 8, height: 0)
    }
}
