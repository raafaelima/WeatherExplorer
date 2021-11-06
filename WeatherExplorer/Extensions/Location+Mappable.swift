//
//  Location+Mappable.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 06/11/2021.
//

import Foundation

extension Location: Mappable {

    func mapToPersistenceObject() -> LocationDTO {
        return LocationDTO(
            name: self.name,
            country: self.country,
            region: self.region,
            latitude: self.latitude,
            longitude: self.longitude,
            weather: self.weather.mapToPersistenceObject()
        )
    }

    static func mapFromPersistenceObject(_ object: LocationDTO) -> Location {
        return Location(
            name: object.name,
            country: object.country,
            region: object.region,
            latitude: object.latitude,
            longitude: object.longitude,
            weather: Weather.mapFromPersistenceObject(object.weather ?? WeatherDTO.noData)
        )
    }
}
