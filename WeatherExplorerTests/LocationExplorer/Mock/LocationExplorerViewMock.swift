//
//  LocationExplorerViewMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 08/11/2021.
//

import Foundation
@testable import WeatherExplorer

class LocationExplorerViewMock: LocationExplorerView {

    var location: Location = Location.noData
    var locations: [Location] = []
    var didCallPresentWeather = false
    var didCallPresentLastSearched = false
    var didCallShowNoWeatherForLocation = false

    func presentWeather(of location: Location) {
        self.location = location
        didCallPresentWeather = true
    }

    func presentLastSearched(locations: [Location]) {
        self.locations = locations
        didCallPresentLastSearched = true
    }

    func showNoWeatherForLocationError() {
        didCallShowNoWeatherForLocation = true
    }
}
