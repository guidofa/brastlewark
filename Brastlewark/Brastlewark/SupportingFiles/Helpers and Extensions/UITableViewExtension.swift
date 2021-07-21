//
//  UITableViewExtension.swift
//  Brastlewark
//
//  Created by Guido Fabio on 21/07/2021.
//

import UIKit

extension UITableView {
    func styleTableViewForBrastlewark() {
        self.tableFooterView = UIView()
        self.backgroundColor = ColorHelper.brightColor()
    }
}
