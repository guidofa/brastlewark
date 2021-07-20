//
//  ListPresenter.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

protocol ListPresenterProtocol: BasePresenterProtocol {
    func getGnomes()
    func getGnomesSuccess(data: [GnomeEntity]?)
    func filterGnomes(with text: String)
}

class ListPresenter: ListModule.Presenter, ListPresenterProtocol {
    
    func getGnomes() {
        interactor?.getGnomes()
    }
    
    func getGnomesSuccess(data: [GnomeEntity]?) {
        view?.getGnomesSuccess(data: data)
    }
    
    func filterGnomes(with text: String) {
        print("Gnomes")
    }
}
