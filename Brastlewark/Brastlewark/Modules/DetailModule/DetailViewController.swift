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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.styleTableViewForBrastlewark()
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
        cells.append(.header)
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
        }
        return UITableViewCell()
    }
}
