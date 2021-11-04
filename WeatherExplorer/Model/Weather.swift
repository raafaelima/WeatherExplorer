//
//  Weather.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct Weather {
    let temperature: Int
    let feelsLike: Int
    let descriptions: [String]

    static let noData = Weather(temperature: 0, feelsLike: 0, descriptions: [])

    func temperatureWithIndicator() -> String {
        return "  \(temperature)˚"
    }

    func feelsLikeWithIndicator() -> String {
        return "\(feelsLike)˚"
    }
}
