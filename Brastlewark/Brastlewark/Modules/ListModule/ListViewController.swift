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
    @IBOutlet fileprivate weak var searchBar: UISearchBar!
    
    fileprivate var gnomesToShow: [GnomeEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getGnomes()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = ColorHelper.brightColor()
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
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomesToShow.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GnomeCardCell")
            as? GnomeCardCell {
            cell.configure(withGnome: gnomesToShow[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.filterGnomes(with: searchBar.text ?? "")
    }
}
