//
//  DetailModule.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

class DetailModule: NSObject {
    static func assemble() -> DetailViewProtocol {
        let view = DetailViewController.create()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
                
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
        var interactor: DetailInteractorProtocol?
        var router: DetailRouterProtocol?
        
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class Router: NSObject {
        
        weak var presenter: DetailPresenterProtocol?
    }
}
