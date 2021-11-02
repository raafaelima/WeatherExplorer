//
//  WeatherResponse.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let temperature: Int
    let weatherDescriptions: [String]
    let feelslike: Int

    enum CodingKeys: String, CodingKey {
        case feelslike
        case temperature
        case weatherDescriptions = "weather_descriptions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try values.decode(Int.self, forKey: .temperature)
        weatherDescriptions = try values.decode([String].self, forKey: .weatherDescriptions)
        feelslike = try values.decode(Int.self, forKey: .feelslike)
    }
}
