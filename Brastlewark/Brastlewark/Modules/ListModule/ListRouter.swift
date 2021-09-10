//
//  ListRouter.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import Foundation

protocol ListRouterProtocol: AnyObject {
    func pushToDetail(gnome: GnomeEntity)
}

class ListRouter: ListModule.Router, ListRouterProtocol {
    
    func pushToDetail(gnome: GnomeEntity) {
        presenter?.navigation?.pushViewController(DetailModule.assemble(gnomeToShow: gnome), animated: true)
    }
}
