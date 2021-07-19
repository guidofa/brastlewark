//
//  DetailViewController.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

protocol DetailViewProtocol: UIViewController {
    
}

class DetailViewController: DetailModule.View, DetailViewProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create() -> DetailViewController {
        if let detailController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "DetailViewController")
            as? DetailViewController {
            return detailController
        }
        return DetailViewController()
    }
}
