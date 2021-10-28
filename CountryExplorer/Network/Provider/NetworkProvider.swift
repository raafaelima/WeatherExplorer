//
//  NetworkProvider.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol NetworkProvider {
    var reachability: ReachabilityType { get }
    var cacheManager: CacheManager { get }

    func requestData<T: Codable>(from endpoint: Endpoint, completion: @escaping (Result<T, ApiError>) -> Void)
}
