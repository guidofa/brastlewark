//
//  DetailViewController.swift
//  Brastlewark
//
//  Created by Guido Fabio on 19/07/2021.
//

import UIKit

protocol DetailViewProtocol: UIViewController {
    func getGnomeSuccess(gnome: GnomeEntity)
}

class DetailViewController: DetailModule.View, DetailViewProtocol {
    @IBOutlet fileprivate var tableView: UITableView!
    fileprivate var cells: [TableCellType] = []
    fileprivate var gnomeToShow: GnomeEntity? {
        didSet {
            addCellsToShow()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate enum TableCellType {
        case header
        case professions
        case friends
        case noFriends
        case noProfessions
        fileprivate var height: CGFloat {
            switch self {
            case .header:
                return UITableView.automaticDimension
            case .professions, .friends:
                return 190
            case .noFriends, .noProfessions:
                return 100
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.styleTableViewForBrastlewark(color: ColorHelper.brightestColor())
        view.backgroundColor = ColorHelper.darkestColor()
        presenter?.getGnome()
    }
    
    static func create() -> DetailViewController {
        if let detailController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "DetailViewController")
            as? DetailViewController {
            return detailController
        }
        return DetailViewController()
    }
    
    func addCellsToShow() {
        guard let gnome = gnomeToShow else { return }
        cells.append(.header)
        if gnome.professions.isEmpty {
            cells.append(.noProfessions)
        } else {
            cells.append(.professions)
        }
        if gnome.friends.isEmpty {
            cells.append(.noFriends)
        } else {
            cells.append(.friends)
        }
    }
    
    func getGnomeSuccess(gnome: GnomeEntity) {
        title = gnome.name
        gnomeToShow = gnome
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gnome = gnomeToShow else { return UITableViewCell() }
        switch cells[indexPath.row] {
        case .header:
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "DetailHeaderCell")
                as? DetailHeaderCell {
                cell.configure(withGnome: gnome)
                return cell
            }
        case .professions:
            return getCarouselCell(array: gnomeToShow?.professions ?? ["No profession"],
                                   title: "Professions",
                                   tableView: tableView)
        case .friends:
            return getCarouselCell(array: gnomeToShow?.friends ?? ["No friends"],
                            title: "Friends",
                            tableView: tableView)
        case .noFriends:
            return getArrayEmptyCell(message: "This gnome doesn't have any friends yet", tableView: tableView)
        case .noProfessions:
            return getArrayEmptyCell(message: "This gnome doesn't have a profession yet", tableView: tableView)
        }
        return UITableViewCell()
    }
    
    func getCarouselCell(array: [String], title: String, tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableCell")
            as? CarouselTableCell {
            cell.configureWithArray(array: array, title: title)
            return cell
        }
        return UITableViewCell()
    }
    
    func getArrayEmptyCell(message: String, tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArrayEmptyCell")
            as? ArrayEmptyCell {
            cell.configure(withMessage: message)
            return cell
        }
        return UITableViewCell()
    }
}
