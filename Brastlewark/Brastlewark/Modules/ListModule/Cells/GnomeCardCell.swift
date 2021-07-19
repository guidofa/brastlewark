//
//  GnomeCardCell.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

class GnomeCardCell: UITableViewCell {
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    
    func configure(name: String) {
        nameLabel.text = name
    }
}
