//
//  CountriesResponse+ParseToModel.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

extension WeatherResponse {
    func parse() -> Location {
        return Location(
            name: self.location.name,
            country: self.location.country,
            region: self.location.region,
            latitude: self.location.latitude,
            longitude: self.location.longitude,
            weather: parseWeather()
        )
    }

    private func parseWeather() -> Weather {
        return Weather(
            temperature: self.weather.temperature,
            feelsLike: self.weather.feelslike,
            descriptions: self.weather.weatherDescriptions
        )
    }
}
