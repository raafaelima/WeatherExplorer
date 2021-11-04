//
//  SuggestionsTableViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 03/11/2021.
//

import UIKit

class SuggestionsTableViewController: UITableViewController {

    internal var suggestionsDataSet: [Suggestion] = []
    internal var suggestionsPresenter: SuggestionsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.suggestionsPresenter = SuggestionsPresenter(delegate: self)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsDataSet.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCell", for: indexPath)
        let suggestion = suggestionsDataSet[indexPath.row]
        cell.textLabel?.text = suggestion.name
        cell.detailTextLabel?.text = "\(suggestion.region), \(suggestion.country)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let selectedItem = matchingItems[indexPath.row]
        dismiss(animated: true, completion: nil)
    }
}

extension SuggestionsTableViewController: SuggestionsView {
    func present(_ suggestions: [Suggestion]) {
        self.suggestionsDataSet = suggestions
        self.tableView.reloadData()
    }
}

extension SuggestionsTableViewController: UISearchBarDelegate, UISearchResultsUpdating {

    // TODO: Request API for Weather Information
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let location = searchBar.text, !location.isEmpty else {
            return
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let location = searchController.searchBar.text, !location.isEmpty else {
            return
        }

        self.suggestionsPresenter?.lastSearched(location)
    }
}
