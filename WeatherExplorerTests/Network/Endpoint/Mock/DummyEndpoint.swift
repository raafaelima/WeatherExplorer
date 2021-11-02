//
//  DummyEndpoint.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation
@testable import WeatherExplorer

struct DummyEndpoint: Endpoint {
    var path: String = "/dummy"
    var params: [URLQueryItem] = []
}
