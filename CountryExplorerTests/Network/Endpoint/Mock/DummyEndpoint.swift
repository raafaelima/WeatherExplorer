//
//  DummyEndpoint.swift
//  CountryExplorerTests
//
//  Created by CTW00710-Admin on 28/10/2021.
//

import Foundation
@testable import CountryExplorer

struct DummyEndpoint: Endpoint {
    var path: String = "/dummy"
    var params: [URLQueryItem] = []
}
