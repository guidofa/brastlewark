//
//  DetailModule.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

class DetailModule: NSObject {
    static func assemble(gnomeToShow gnome: GnomeEntity) -> DetailViewProtocol {
        let view = DetailViewController.create()
        let presenter = DetailPresenter()
        presenter.view = view
        presenter.gnome = gnome
        view.presenter = presenter
                
        return view
    }
    
    class View: UIViewController {
        
        var presenter: DetailPresenterProtocol?
    }
    
    class Interactor: NSObject {
        
        weak var presenter: DetailPresenterProtocol?
    }
    
    class Presenter: NSObject {
        
        weak var view: DetailViewProtocol?
        
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class Router: NSObject {
        
        weak var presenter: DetailPresenterProtocol?
    }
}
