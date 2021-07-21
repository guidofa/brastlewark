//
//  CarouselCollectionCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 21/07/2021.
//

import UIKit

class CarouselCollectionCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var stringToShowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = ColorHelper.darkColor()
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = ColorHelper.darkestColor().cgColor
        stringToShowLabel.textColor = ColorHelper.brightestColor()
    }
    
    func configure(withString stringToShow: String) {
        stringToShowLabel.text = stringToShow
    }
}
