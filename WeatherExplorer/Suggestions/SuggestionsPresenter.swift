//
//  SuggestionsPresenter.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 03/11/2021.
//

import Foundation

struct SuggestionsPresenter {

    private weak var delegate: SuggestionsView?
    private var repository: SuggestionRepository

    init(delegate: SuggestionsView, repository: SuggestionRepository = SuggestionRepository()) {
        self.delegate = delegate
        self.repository = repository
    }

    func lastSearched(_ location: String) {
        let filteredSuggestions = repository.lastSearchedLocations().filter({ $0.name.contains(location) })
        delegate?.present(filteredSuggestions)
    }
}
