//
//  LocationExplorerViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

class LocationExplorerViewController: UIViewController {

    var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }

    private func setupSearchBar() {
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "suggestions") as! SuggestionsTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable

        resultSearchController?.searchBar.sizeToFit()
        resultSearchController?.searchBar.placeholder = "Search for places"
        resultSearchController?.hidesNavigationBarDuringPresentation = false

        navigationItem.titleView = resultSearchController?.searchBar
        definesPresentationContext = true
    }
}
