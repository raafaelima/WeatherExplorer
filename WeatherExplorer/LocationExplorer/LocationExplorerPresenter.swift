//
//  LocationExplorerPresenter.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

struct LocationExplorerPresenter {

    internal var service: WeatherService
    weak var delegate: LocationExplorerView?

    init(delegate: LocationExplorerView, service: WeatherService = WeatherService()) {
        self.delegate = delegate
        self.service = service
    }

    func currentWeather(of city: String) {
        service.currentWeather(of: city) { location in
            OperationQueue.main.addOperation({
                delegate?.presentWeather(of: location)
            })
        }
    }
}
