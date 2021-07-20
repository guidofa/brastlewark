//
//  UIButtonExtension.swift
//  Brastlewark
//
//  Created by Guido Fabio on 20/07/2021.
//

import UIKit

extension UIButton {
    func styleDarkestSquared() {
        self.backgroundColor = ColorHelper.darkestColor()
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 3
        self.setTitle(self.titleLabel?.text?.uppercased(), for: UIControl.State())
        self.setTitleColor(UIColor.white, for: UIControl.State())
        self.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
}
