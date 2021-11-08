//
//  LocationExplorerPresenter.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

struct LocationExplorerPresenter {

    private var service: WeatherService
    private var repository: LocationRepository

    weak var delegate: LocationExplorerView?

    init(delegate: LocationExplorerView, service: WeatherService = WeatherService(), repository: LocationRepository = LocationRepository()) {
        self.delegate = delegate
        self.service = service
        self.repository = repository
    }

    func currentWeather(of city: String) {
        service.currentWeather(of: city) { location in
            OperationQueue.main.addOperation({
                if !location.name.isEmpty {
                    save(location: location)
                    delegate?.presentWeather(of: location)
                } else {
                    delegate?.showNoWeatherForLocationError()
                }
            })
        }
    }

    func lastSearchedLocations() {
        repository.lastSearchedLocations { locations in
            OperationQueue.main.addOperation({
                delegate?.presentLastSearched(locations: locations)
            })
        }
    }

    private func save(location: Location) {
        repository.save(location: location)
    }
}
