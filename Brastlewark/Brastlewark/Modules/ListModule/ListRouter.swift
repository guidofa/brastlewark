//
//  ListRouter.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

protocol ListRouterProtocol: AnyObject {
    
}

class ListRouter: ListModule.Router, ListRouterProtocol {
    var home: UINavigationController?
        
    var homeViewController: UIViewController? {
        return home?.viewControllers.first
    }
}
