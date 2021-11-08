//
//  LocationExplorerViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

class LocationExplorerViewController: UITableViewController, Storyboarded {

    internal weak var coordinator: MainCoordinator?
    internal var lastSearchLocationsDataSet: [Location] = []
    internal var presenter: LocationExplorerPresenter?
    private var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        presenter = LocationExplorerPresenter(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.lastSearchedLocations()
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

extension LocationExplorerViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastSearchLocationsDataSet.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lastSearchedCell", for: indexPath)
        let lastSearched = lastSearchLocationsDataSet[indexPath.row]
        cell.textLabel?.text = lastSearched.name
        cell.detailTextLabel?.text = lastSearched.description()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = lastSearchLocationsDataSet[indexPath.row]
        coordinator?.details(of: location)
        dismiss(animated: true, completion: nil)
    }
}

extension LocationExplorerViewController: LocationExplorerView {

    func presentWeather(of location: Location) {
        coordinator?.details(of: location)
    }

    func presentLastSearched(locations: [Location]) {
        lastSearchLocationsDataSet = locations
        self.tableView.reloadData()
    }

    func showNoWeatherForLocationError() {
        let title = NSLocalizedString("emptyDataAlertTitle", comment: "")
        let message = NSLocalizedString("emptyDataAlertMessage", comment: "")

        let alert = AlertManager.shared.buildAlert(with: title, and: message)
        self.present(alert, animated: true)
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
