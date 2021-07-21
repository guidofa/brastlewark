//
//  DetailHeaderCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 21/07/2021.
//

import UIKit

class DetailHeaderCell: UITableViewCell {
    @IBOutlet fileprivate weak var profilePhoto: UIImageView!
    @IBOutlet fileprivate weak var ageLabel: UILabel!
    @IBOutlet fileprivate weak var heightLabel: UILabel!
    @IBOutlet fileprivate weak var weightLabel: UILabel!
    @IBOutlet fileprivate weak var hairColorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = ColorHelper.darkestColor()
        setTextsColor()
    }
    
    func configure(withGnome gnome: GnomeEntity) {
        profilePhoto.setThumbnailImage(url: gnome.thumbnail)
    }
    
    func setTextsColor() {
        let textColor = ColorHelper.brightestColor()
        ageLabel.textColor = textColor
        heightLabel.textColor = textColor
        weightLabel.textColor = textColor
        hairColorLabel.textColor = textColor
    }
}
