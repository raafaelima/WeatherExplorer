//
//  Weather+Mappable.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 06/11/2021.
//

import Foundation

extension Weather: Mappable {

    func mapToPersistenceObject() -> WeatherDTO {
        return WeatherDTO(
            temperature: self.temperature,
            feelsLike: self.feelsLike,
            descriptions: self.descriptions
        )
    }

    static func mapFromPersistenceObject(_ object: WeatherDTO) -> Weather {

        var weatherDescriptions = [String]()

        object.descriptions.forEach { description in
            weatherDescriptions.append(description)
        }

        return Weather(
            temperature: object.temperature,
            feelsLike: object.feelsLike,
            descriptions: weatherDescriptions
        )
    }
}
