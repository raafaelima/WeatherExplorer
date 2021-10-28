//
//  NetworkProvider.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol NetworkProvider {
    var reachability: ReachabilityType { get }

    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void)
}
