//
//  WeatherDTO.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 06/11/2021.
//

import Foundation
import RealmSwift

class WeatherDTO: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var temperature: Int = 0
    @objc dynamic var feelsLike: Int = 0
    let descriptions = List<String>()

    static let noData = WeatherDTO(temperature: 0, feelsLike: 0, descriptions: [])

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(temperature: Int, feelsLike: Int, descriptions: [String]) {
        self.init()
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.descriptions.append(objectsIn: descriptions)
    }
}
