//
//  AllCountriesService.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

struct AllCountriesService: Service {

    var endpoint: Endpoint
    var dataParser: DataParser
    var cacheManager: CacheManager
    var networkProvider: NetworkProvider

    init(endpoint: Endpoint = AllCountriesEndpoint(),
         dataParser: DataParser = JsonDataParser(),
         cacheManager: CacheManager = LocalCacheManager(),
         networkProvider: NetworkProvider = URLSessionNetworkProvider()) {
        self.endpoint = endpoint
        self.dataParser = dataParser
        self.cacheManager = cacheManager
        self.networkProvider = networkProvider
    }

    func get(completion: @escaping ([Country]) -> Void) {
        networkProvider.requestData(from: endpoint) { (result: Result<Data, ApiError>) in
            switch result {
            case .success(let response):
                handleSuccess(response, completion)
            case .failure(let error):
                print("ApiError: \(error)")
                handleError(completion)
            }
        }
    }

    private func handleSuccess(_ response: Data, _ completion: @escaping ([Country]) -> Void) {
        cacheManager.save(onCache: response)
        parseDataToModel(data: response, completion)
    }

    private func handleError(_ completion: @escaping ([Country]) -> Void) {
        let cachedData = cacheManager.load()
        parseDataToModel(data: cachedData, completion)
    }

    private func parseDataToModel(data: Data, _ completion: @escaping ([Country]) -> Void) {
        dataParser.process(data: data) { (result: Result<[CountriesResponse], ParserError>) in
            switch result {
            case .success(let parsedData):
                let countries = parsedData.compactMap({ $0.parse() })
                completion(countries)
            case .failure(let error):
                print("Error at Parsing Data: \(error)")
                completion([])
            }
        }
    }
}
