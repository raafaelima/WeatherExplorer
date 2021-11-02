//
//  MarvelResponse.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct CountriesResponse: Codable {

    let name: String
    let capital: String
    let region: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case region = "region"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        capital = try values.decode(String.self, forKey: .capital)
        region = try values.decode(String.self, forKey: .region)
    }
}
