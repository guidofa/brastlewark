//
//  ListErrorCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 20/07/2021.
//

import UIKit
import Lottie

class ListErrorCell: UITableViewCell {
    @IBOutlet fileprivate var animationView: AnimationView!
    @IBOutlet fileprivate var messageToShow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.backgroundColor = ColorHelper.brightColor()
        self.contentView.backgroundColor = ColorHelper.brightColor()
    }
    
    func configure(withMessage message: String) {
        messageToShow.text = message
        animationView.play()
    }
}
