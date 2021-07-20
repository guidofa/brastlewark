//
//  ListViewController.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import UIKit

protocol ListViewProtocol: UIViewController {
    func getGnomesSuccess(data: [GnomeEntity]?)
    func filterGnomesByNameResult(gnomesFiltered: [GnomeEntity])
    func getOriginalListSuccess(originalGnomesList: [GnomeEntity])
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
        view.backgroundColor = ColorHelper.brightColor()
        tableView.backgroundColor = ColorHelper.brightColor()
        searchBar.barTintColor = ColorHelper.brightColor()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont(name: "Montserrat-Regular", size: 16)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
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
    
    func filterGnomesByNameResult(gnomesFiltered: [GnomeEntity]) {
        gnomesToShow = gnomesFiltered
    }
    
    func getOriginalListSuccess(originalGnomesList: [GnomeEntity]) {
        gnomesToShow = originalGnomesList
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomesToShow.isEmpty ? 1 : gnomesToShow.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if gnomesToShow.isEmpty {
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "ListErrorCell")
                as? ListErrorCell {
                return cell
            }
        }
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
        if let stringToFilter = searchBar.text, !stringToFilter.isEmpty {
            presenter?.filterGnomesByName(with: stringToFilter)
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        presenter?.getOriginalList()
    }
}
