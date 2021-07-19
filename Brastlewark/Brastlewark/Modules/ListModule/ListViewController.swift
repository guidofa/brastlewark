//
//  ListViewController.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

protocol ListViewProtocol: UIViewController {
    func getGnomesSuccess(data: [GnomeEntity]?)
}

class ListViewController: ListModule.View, ListViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var gnomesToShow: [GnomeEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getGnomes()
    }
    
    static func create() -> ListViewController {
        if let listController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ListViewController")
            as? ListViewController {
            return listController
        }
        return ListViewController()
    }
    
    func getGnomesSuccess(data: [GnomeEntity]?) {
        if let gnomes = data {
            gnomesToShow = gnomes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomesToShow.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GnomeCardCell")
            as? GnomeCardCell {
            cell.configure(name: gnomesToShow[indexPath.row].name)
            return cell
        }
        return UITableViewCell()
    }
}
