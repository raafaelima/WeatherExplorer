//
//  URLSessionNetworkProvider.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct URLSessionNetworkProvider: NetworkProvider {

    var session: URLSession
    var reachability: ReachabilityType

    init(session: URLSession = .pinning, reachability: ReachabilityType = Reachability()) {
        self.session = session
        self.reachability = reachability
    }

    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void) {

        let remoteDataTask = session.dataTask(with: endpoint.urlRequest()) { data, _, _ in

            guard let receivedData = data else {
                completion(.failure(.emptyData))
                return
            }

            completion(.success(receivedData))
        }

        if reachability.currentStatus() == .notReachable {
            completion(.failure(.notReachable))
        } else {
            remoteDataTask.resume()
        }
    }
}
