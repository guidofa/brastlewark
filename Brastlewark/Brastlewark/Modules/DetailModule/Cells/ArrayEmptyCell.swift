//
//  ArrayEmptyCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 21/07/2021.
//

import UIKit

class ArrayEmptyCell: UITableViewCell {
    @IBOutlet fileprivate weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = ColorHelper.brightestColor()
        messageLabel.textColor = ColorHelper.darkestColor()
    }
    
    func configure(withMessage message: String) {
        messageLabel.text = message
    }
}
