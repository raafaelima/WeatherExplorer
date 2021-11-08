//
//  Location.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct Location: Model {

    let name: String
    let country: String
    let region: String
    let latitude: Double
    let longitude: Double
    let weather: Weather

    static var noData: Location = Location(name: "", country: "", region: "", latitude: 0.0, longitude: 0.0, weather: Weather.noData)

    func description() -> String {
        return "\(region), \(country)"
    }
}
