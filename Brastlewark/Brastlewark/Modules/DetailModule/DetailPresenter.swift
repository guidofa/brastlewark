//
//  DetailPresenter.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

protocol DetailPresenterProtocol: BasePresenterProtocol {
    func getGnome()
}

class DetailPresenter: DetailModule.Presenter, DetailPresenterProtocol {
    var gnome: GnomeEntity?
    
    func getGnome() {
        guard let gnomeToShow = gnome else { return }
        view?.getGnomeSuccess(gnome: gnomeToShow)
    }
}
