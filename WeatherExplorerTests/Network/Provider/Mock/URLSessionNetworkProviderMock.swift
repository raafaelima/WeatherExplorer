//
//  URLSessionNetworkProviderMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

@testable import WeatherExplorer

class URLSessionNetworkProviderMock: NetworkProvider {

    var forceError = false
    var didCallRequestData = false
    var endpointRequestURL = ""
    var cacheManager: CacheManager = CacheManagerMock()
    var reachability: ReachabilityType = ReachabilityMock()

    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void) {
        self.didCallRequestData = true
        self.endpointRequestURL = endpoint.urlRequest().url!.absoluteString

        if forceError {
            completion(.failure(.emptyData))
        } else {
            let data = JSONHelper.getDataFrom(json: "weather")!
            completion(.success(data))
        }
    }
}
