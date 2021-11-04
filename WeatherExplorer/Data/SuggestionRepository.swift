//
//  SuggestionRepository.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

class SuggestionRepository {

    // TODO: Replace by Real Database Implementation
    func lastSearchedLocations() -> [Suggestion] {
        return [
            Suggestion(name: "Recife", country: "Brazil", region: "Pernambuco"),
            Suggestion(name: "Rondonia", country: "Brazil", region: "Pernambuco"),
            Suggestion(name: "Porto", country: "Portugal", region: "Porto"),
            Suggestion(name: "Dublin", country: "Ireland", region: "Dublin")
        ]
    }
}
