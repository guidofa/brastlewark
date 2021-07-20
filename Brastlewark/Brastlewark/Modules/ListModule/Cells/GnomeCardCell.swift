//
//  GnomeCardCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit
import Kingfisher

class GnomeCardCell: UITableViewCell {
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var ageValueLabel: UILabel!
    @IBOutlet fileprivate weak var heightValueLabel: UILabel!
    @IBOutlet fileprivate weak var weightValueLabel: UILabel!
    @IBOutlet fileprivate weak var friendsAmountLabel: UILabel!
    @IBOutlet fileprivate weak var thumbnailImageView: UIImageView!
    @IBOutlet fileprivate weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCardView()
    }
    func configure(withGnome gnome: GnomeEntity) {
        nameLabel.text = gnome.name
        ageValueLabel.text = String(gnome.age)
        heightValueLabel.text = String(gnome.height)
        weightValueLabel.text = String(gnome.weight)
        friendsAmountLabel.text = String(gnome.friends.count)
        thumbnailImageView.setThumbnailImage(url: gnome.thumbnail)
        thumbnailImageView.layer.cornerRadius = 8
    }
    
    func styleCardView() {
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 4
        cardView.backgroundColor = ColorHelper.darkColor()
        self.contentView.backgroundColor = ColorHelper.brightColor()
    }
}
