//
//  WeatherServiceMock.swift
//  WeatherExplorerTests
//
//  Created by CTW00710-Admin on 08/11/2021.
//

import Foundation
@testable import WeatherExplorer

class WeatherServiceMock: Service {

    internal var dataParser: DataParser = JsonDataParserMock()
    internal var cacheManager: CacheManager = CacheManagerMock()
    internal var networkProvider: NetworkProvider = URLSessionNetworkProviderMock()

    var didCallFetchData = false
    var forceError = false

    func fetchData(with param: String, completion: @escaping (Model) -> Void) {
        didCallFetchData = true
        if forceError {
            completion(Location.noData)
        } else {
            let recife =  Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
            completion(recife)
        }
    }
}
