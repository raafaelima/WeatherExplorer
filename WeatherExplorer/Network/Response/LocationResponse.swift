//
//  LocationResponse.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct LocationResponse: Codable {
    let name: String
    let country: String
    let region: String
    let latitude: String
    let longitude: String

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case region
        case latitude = "lat"
        case longitude = "lon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        country = try values.decode(String.self, forKey: .country)
        region = try values.decode(String.self, forKey: .region)
        latitude = try values.decode(String.self, forKey: .latitude)
        longitude = try values.decode(String.self, forKey: .longitude)
    }
}
