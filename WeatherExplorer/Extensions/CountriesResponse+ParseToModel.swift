//
//  CountriesResponse+ParseToModel.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

extension CountriesResponse {
    func parse() -> Country {
        return Country(name: self.name, capital: self.capital, region: self.region)
    }
}
