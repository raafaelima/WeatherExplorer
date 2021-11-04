//
//  WeatherService.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

struct WeatherService: Service {

    var dataParser: DataParser
    var cacheManager: CacheManager
    var networkProvider: NetworkProvider

    init(dataParser: DataParser = JsonDataParser(),
         cacheManager: CacheManager = LocalCacheManager(),
         networkProvider: NetworkProvider = URLSessionNetworkProvider()) {
        self.dataParser = dataParser
        self.cacheManager = cacheManager
        self.networkProvider = networkProvider
    }

    func currentWeather(of location: String, completion: @escaping (Location) -> Void) {
        let endpoint = CurrentWeatherEndpoint(city: location)
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

    private func handleSuccess(_ response: Data, _ completion: @escaping (Location) -> Void) {
        cacheManager.save(onCache: response)
        parseDataToModel(data: response, completion)
    }

    private func handleError(_ completion: @escaping (Location) -> Void) {
        let cachedData = cacheManager.load()
        parseDataToModel(data: cachedData, completion)
    }

    private func parseDataToModel(data: Data, _ completion: @escaping (Location) -> Void) {
        dataParser.process(data: data) { (result: Result<WeatherResponse, ParserError>) in
            switch result {
            case .success(let data):
                let locationWithWeatherInfo = data.parse()
                completion(locationWithWeatherInfo)
            case .failure(let error):
                print("Error at Parsing Data: \(error)")
                completion(Location.noData)
            }
        }
    }
}
