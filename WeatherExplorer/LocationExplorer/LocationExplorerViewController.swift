//
//  LocationExplorerViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

class LocationExplorerViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    private var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }

    private func setupSearchBar() {
        let locationSearchTable = SuggestionsTableViewController.instantiate()
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        resultSearchController?.delegate = self
        resultSearchController?.searchBar.delegate = self

        resultSearchController?.searchBar.sizeToFit()
        resultSearchController?.searchBar.placeholder = "Search for places"
        resultSearchController?.hidesNavigationBarDuringPresentation = false

        navigationItem.titleView = resultSearchController?.searchBar
        definesPresentationContext = true
    }
}

extension LocationExplorerViewController: LocationExplorerView {
    func presentWeather(of location: Location) {
        coordinator?.details(of: location)
    }
}

extension LocationExplorerViewController: UISearchControllerDelegate, UISearchBarDelegate {
    // SearchOnAPI
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let location = searchBar.text, !location.isEmpty else {
            return
        }
    }
}
