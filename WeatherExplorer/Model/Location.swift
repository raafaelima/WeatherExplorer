//
//  Location.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct Location {
    let name: String
    let country: String
    let region: String
    let latitude: String
    let longitude: String
    let weather: Weather

    static let noData = Location(name: "", country: "", region: "", latitude: "", longitude: "", weather: Weather.noData)
}
