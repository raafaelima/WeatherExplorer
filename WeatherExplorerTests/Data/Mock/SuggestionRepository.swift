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

    override func lastSearchedLocations() -> [Location] {
        didCallLastSearchLocation = true

        if forceError {
            return []
        } else {
            return [
                Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Rondonia", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Porto", country: "Portugal", region: "Porto", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Dublin", country: "Ireland", region: "Dublin", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
            ]
        }
    }
}
