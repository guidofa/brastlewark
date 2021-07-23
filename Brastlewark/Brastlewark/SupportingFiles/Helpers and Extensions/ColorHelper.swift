//
//  ColorHelper.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

class ColorHelper: NSObject {
    
    // MARK: You can change the whole color palette here.
    class func darkestColor(alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: 5/255, green: 102/255, blue: 118/255, alpha: alpha)
    }
    
    class func darkColor() -> UIColor {
        return UIColor(red: 94/255, green: 170/255, blue: 168/255, alpha: 1)
    }
    
    class func brightColor() -> UIColor {
        return UIColor(red: 163/255, green: 210/255, blue: 202/255, alpha: 1)
    }
    
    class func brightestColor() -> UIColor {
        return UIColor(red: 232/255, green: 222/255, blue: 210/255, alpha: 1)
    }
}
