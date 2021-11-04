//
//  SuggestionRepositoryMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation
@testable import WeatherExplorer

class SuggestionRepositoryMock: SuggestionRepository {

    var forceError = false
    var didCallLastSearchLocation = false

    override func lastSearchedLocations() -> [Suggestion] {
        didCallLastSearchLocation = true

        if forceError {
            return []
        } else {
            return [
                Suggestion(name: "Recife", country: "Brazil", region: "Pernambuco"),
                Suggestion(name: "Rondonia", country: "Brazil", region: "Pernambuco"),
                Suggestion(name: "Porto", country: "Portugal", region: "Porto"),
                Suggestion(name: "Dublin", country: "Ireland", region: "Dublin")
            ]
        }
    }
}
