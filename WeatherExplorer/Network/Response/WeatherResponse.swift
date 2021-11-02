//
//  WeatherResponse.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct WeatherResponse: Codable {

    let location: LocationResponse
    let weather: CurrentWeatherResponse

    enum CodingKeys: String, CodingKey {
        case location = "location"
        case weather = "current"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decode(LocationResponse.self, forKey: .location)
        weather = try values.decode(CurrentWeatherResponse.self, forKey: .weather)
    }
}
