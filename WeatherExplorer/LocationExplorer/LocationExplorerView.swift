//
//  LocationExplorerView.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

protocol LocationExplorerView: AnyObject {
    func presentWeather(of location: Location)
}
