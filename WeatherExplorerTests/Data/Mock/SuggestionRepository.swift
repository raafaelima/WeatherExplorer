//
//  LocationRepositoryMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation
@testable import WeatherExplorer

class LocationRepositoryMock: LocationRepository {

    var forceError = false
    var didCallLastSearchLocation = false

    override func lastSearched(location: String, completionHandler: ([Location]) -> Void) {

        var locations: [Location] = []
        didCallLastSearchLocation = true

        if !forceError {
            locations = [
                Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Rondonia", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Porto", country: "Portugal", region: "Porto", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
                Location(name: "Dublin", country: "Ireland", region: "Dublin", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
            ]
        }

        let filteredLocations = locations.filter({ $0.name.contains(location) })
        completionHandler(filteredLocations)
    }
}
