//
//  Endpoint.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol Endpoint {
    var path: String { get set }
    var params: [URLQueryItem] { get set }
}
