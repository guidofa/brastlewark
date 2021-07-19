//
//  DetailRouter.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

protocol DetailRouterProtocol: AnyObject {
    
}

class DetailRouter: DetailModule.Router, DetailRouterProtocol {
    var home: UINavigationController?
        
    var homeViewController: UIViewController? {
        return home?.viewControllers.first
    }
}
