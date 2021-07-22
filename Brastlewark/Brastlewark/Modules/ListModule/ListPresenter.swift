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
    func getGnomeFailed(message: String)
    func filterGnomesByName(with text: String)
    func getOriginalList()
    func showDetail(ofGnome gnome: GnomeEntity)
}

class ListPresenter: ListModule.Presenter, ListPresenterProtocol {
    var gnomes: [GnomeEntity] = []
    
    func getGnomes() {
        interactor?.getGnomes()
    }
    
    func getGnomesSuccess(data: [GnomeEntity]?) {
        if let gnomes = data {
            self.gnomes = gnomes
        }
        view?.getGnomesSuccess(data: data)
    }
    
    func getGnomeFailed(message: String) {
        view?.getGnomeFailed(messageToShow: message)
    }
    
    func filterGnomesByName(with stringToFilter: String) {
        let filteredGnomes = gnomes.filter { $0.name.range(of: stringToFilter, options: .caseInsensitive) != nil }
        view?.filterGnomesByNameResult(gnomesFiltered: filteredGnomes)
    }
    
    func getOriginalList() {
        view?.getOriginalListSuccess(originalGnomesList: gnomes)
    }
    
    func showDetail(ofGnome gnome: GnomeEntity) {
        router?.pushToDetail(gnome: gnome)
    }
}
