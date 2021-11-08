//
//  LocationRepositoryMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation
import RealmSwift

@testable import WeatherExplorer

class LocationRepositoryMock: LocationRepository {

    var forceError = false
    var didCallFetchLocationWith = false
    var didCallLastSearchedLocations = false

    override init(dataManager: DataManager = RealmDataManager(nil)) {
        super.init()
        self.dbManager = dataManager
    }

    override func fetchLocationWith(name: String, completionHandler: ([Location]) -> Void) {
        didCallFetchLocationWith = true

        if forceError {
            completionHandler([])
        } else {
            let filteredLocations = provideLocations().filter({ $0.name.contains(name) })
            completionHandler(filteredLocations)
        }
    }

    override func lastSearchedLocations(completionHandler: ([Location]) -> Void) {
        didCallLastSearchedLocations = true

        if forceError {
            completionHandler([])
        } else {
            let locations = provideLocations()
            completionHandler(locations)
        }
    }

    private func provideLocations() -> [Location] {
        return [
            Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Rondonia", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Porto", country: "Portugal", region: "Porto", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Dublin", country: "Ireland", region: "Dublin", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
        ]
    }
}
