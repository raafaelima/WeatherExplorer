//
//  SuggestionsPresenter.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 03/11/2021.
//

import Foundation

struct SuggestionsPresenter {

    private weak var delegate: SuggestionsView?
    private var repository: LocationRepository

    init(delegate: SuggestionsView, repository: LocationRepository = LocationRepository()) {
        self.delegate = delegate
        self.repository = repository
    }

    func lastSearched(_ location: String) {
        repository.fetchLocationWith(name: location) { locations in
            delegate?.present(locations)
        }
    }
}
