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
    func getGnomeFailed(messageToShow: String)
}

class ListViewController: ListModule.View, ListViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var searchBar: UISearchBar!
    @IBOutlet fileprivate weak var returnToListButton: UIButton!
    @IBAction fileprivate func returnToListOnClick() {
        returnToList()
    }
    
    fileprivate var messageToShow = "Fetching data..."
    fileprivate var gnomesToShow: [GnomeEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSearchBar()
        styleOtherElements()
        returnToListButton.styleDarkestSquared()
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
    
    func styleOtherElements() {
        tableView.styleTableViewForBrastlewark(color: ColorHelper.brightColor())
        view.backgroundColor = ColorHelper.brightColor()
        title = "BrastleWark"
        navigationController?.navigationBar.barTintColor = ColorHelper.darkestColor()
        navigationController?.navigationBar.tintColor = ColorHelper.brightestColor()
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "AmaticSC-Bold", size: 36)!,
             NSAttributedString.Key.foregroundColor: ColorHelper.brightestColor()]
    }
    
    func styleSearchBar() {
        searchBar.barTintColor = ColorHelper.brightColor()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont(name: "Montserrat-Regular", size: 16)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
    }
    
    func getGnomesSuccess(data: [GnomeEntity]?) {
        if let gnomes = data {
            gnomesToShow = gnomes
        }
    }
    
    func getGnomeFailed(messageToShow: String) {
        self.messageToShow = messageToShow
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func filterGnomesByNameResult(gnomesFiltered: [GnomeEntity]) {
        if gnomesFiltered.isEmpty {
            messageToShow = "There aren't any gnomes with that name..."
        }
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
        return gnomesToShow.isEmpty ? UITableView.automaticDimension : 124
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        returnToListButton.isHidden = true
        if gnomesToShow.isEmpty {
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "ListErrorCell")
                as? ListErrorCell {
                cell.configure(withMessage: messageToShow)
                returnToListButton.isHidden = false
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetail(ofGnome: gnomesToShow[indexPath.row])
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
        returnToList()
    }
    
    func returnToList() {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        presenter?.getOriginalList()
    }
}
