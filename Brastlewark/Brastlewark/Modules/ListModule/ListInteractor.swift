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

        self.loadJson(fromURLString: getUrl()) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(GnomesEntity.self, from: jsonData)
            presenter?.getGnomesSuccess(data: decodedData.Brastlewark)
        } catch {
            presenter?.getGnomeFailed(message: "Oops, data not found")
        }
    }
    
    func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}
