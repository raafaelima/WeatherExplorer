//
//  CurrentWeatherEndpoint.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct CurrentWeatherEndpoint: Endpoint {
    var path: String = "/current"
    var params: [URLQueryItem] = []

    init(city: String) {
        self.params = [
            URLQueryItem(name: "query", value: city)
        ]
    }
}
