//
//  URLSessionNetworkProvider.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct URLSessionNetworkProvider: NetworkProvider {

    var session: URLSession
    var cacheManager: CacheManager
    var reachability: ReachabilityType

    init(session: URLSession = .pinning, reachability: ReachabilityType = Reachability(), cacheManager: CacheManager = LocalCacheManager()) {
        self.reachability = reachability
        self.cacheManager = cacheManager
        self.session = session
    }

    func requestData<T: Codable>(from endpoint: Endpoint, completion: @escaping (Result<T, ApiError>) -> Void) {

        let remoteDataTask = session.dataTask(with: endpoint.urlRequest()) { data, _, _ in

            guard let receivedData = data else {
                completion(.failure(.emptyData))
                return
            }

            self.cacheManager.save(onCache: receivedData)
            self.process(data: receivedData, completion)
        }

        if self.reachability.currentStatus() == .notReachable {
            let cachedData = cacheManager.load()
            process(data: cachedData, completion)
        } else {
            remoteDataTask.resume()
        }
    }

    private func process<T: Codable>(data: Data, _ completion: @escaping (Result<T, ApiError>) -> Void) {
        do {
            let objectResponse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(objectResponse))
        } catch {
            completion(.failure(.dataParsing))
        }
    }
}
