//
//  LocationExplorerViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

class LocationExplorerViewController: UIViewController, Storyboarded {

    internal weak var coordinator: MainCoordinator?
    internal var presenter: LocationExplorerPresenter?
    private var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        self.presenter = LocationExplorerPresenter(delegate: self)
    }

    private func setupSearchBar() {
        let locationSearchTable = SuggestionsTableViewController.instantiate()
        locationSearchTable.coordinator = self.coordinator
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        resultSearchController?.delegate = self
        resultSearchController?.searchBar.delegate = self

        resultSearchController?.searchBar.sizeToFit()
        resultSearchController?.searchBar.placeholder = NSLocalizedString("searchBarHint", comment: "")
        resultSearchController?.hidesNavigationBarDuringPresentation = false

        navigationItem.titleView = resultSearchController?.searchBar
        definesPresentationContext = true
    }
}

extension LocationExplorerViewController: LocationExplorerView {
    func presentWeather(of location: Location) {
        coordinator?.details(of: location)
    }

    func showNoWeatherForLocationError() {

    }
}

extension LocationExplorerViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let location = searchBar.text, !location.isEmpty else {
            return
        }

        presenter?.currentWeather(of: location)
    }
}
