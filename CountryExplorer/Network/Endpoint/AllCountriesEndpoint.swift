//
//  AllCountiresEndpoint.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct AllCountriesEndpoint: Endpoint {
    var path: String = "/v2/all"
    var params: [URLQueryItem] = []
}
