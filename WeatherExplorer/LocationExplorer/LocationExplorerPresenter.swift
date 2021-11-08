//
//  LocationExplorerPresenter.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

struct LocationExplorerPresenter {

    private var service: Service
    private var repository: LocationRepository

    weak var delegate: LocationExplorerView?

    init(delegate: LocationExplorerView, service: Service = WeatherService(), repository: LocationRepository = LocationRepository()) {
        self.delegate = delegate
        self.service = service
        self.repository = repository
    }

    func currentWeather(of city: String) {
        repository.fetchLocationWith(name: city) { locations in
            if locations.isEmpty {
                loadFromServer(city: city)
            } else {
                loadFromDatabase(locations: locations)
            }
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

    private func loadFromDatabase(locations: [Location]) {
        OperationQueue.main.addOperation({

            guard let location = locations.first else {
                delegate?.showNoWeatherForLocationError()
                return
            }

            delegate?.presentWeather(of: location)
        })
    }

    private func loadFromServer(city: String) {
        service.fetchData(with: city) { locationModel in
            OperationQueue.main.addOperation({

                let location = locationModel as! Location

                if !location.name.isEmpty {
                    save(location: location)
                    delegate?.presentWeather(of: location)
                } else {
                    delegate?.showNoWeatherForLocationError()
                }
            })
        }
    }
}
