//
//  ListInteractor.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import Foundation

protocol ListInteractorProtocol: AnyObject {
    func getGnomes()
}

class ListInteractor: ListModule.Interactor, ListInteractorProtocol {
    func getUrl() -> String {
        return "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    }
    
    func getGnomes() {
        Network.loadJson(fromURLString: getUrl()) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
                self.presenter?.getGnomeFailed(message: error.localizedDescription)
            }
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(GnomesEntity.self, from: jsonData)
            presenter?.getGnomesSuccess(data: decodedData.brastlewark)
        } catch {
            presenter?.getGnomeFailed(message: "Oops, data not found")
        }
    }
}
