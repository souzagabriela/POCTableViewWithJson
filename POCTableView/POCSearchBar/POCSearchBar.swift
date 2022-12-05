//
//  POCSearchBar.swift
//  POCTableView
//
//  Created by Gabriela Souza Batista on 30/11/22.
//

import UIKit

class ResultsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
    }
}

class POCSearchBar: UIViewController, UISearchResultsUpdating {

    let searchController = UISearchController(searchResultsController: ResultsVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "POC SEARCH BAR"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        print(text)
    }
}
