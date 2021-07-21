//
//  ListModule.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

class ListModule: NSObject {
    static func assemble() -> ListViewProtocol {
        let view = ListViewController.create()
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        return view
    }
    
    class View: UIViewController {
        var presenter: ListPresenterProtocol?
    }
    
    class Interactor: NSObject {
        weak var presenter: ListPresenterProtocol?
    }
    
    class Presenter: NSObject {
        weak var view: ListViewProtocol?
        var interactor: ListInteractorProtocol?
        var router: ListRouterProtocol?
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class Router: NSObject {
        weak var presenter: ListPresenterProtocol?
    }
}
