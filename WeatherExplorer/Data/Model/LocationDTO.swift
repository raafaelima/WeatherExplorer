//
//  LocationDTO.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 06/11/2021.
//

import Foundation
import RealmSwift

class LocationDTO: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var region: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var weather: WeatherDTO?

    override static func primaryKey() -> String? {
        return "name"
    }

    convenience init(name: String, country: String, region: String, latitude: Double, longitude: Double, weather: WeatherDTO) {
        self.init()
        self.name = name
        self.country = country
        self.region = region
        self.latitude = latitude
        self.longitude = longitude
        self.weather = weather
    }
}
