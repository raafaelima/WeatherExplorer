//
//  Service.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

protocol Service {
    var dataParser: DataParser { get }
    var cacheManager: CacheManager { get }
    var networkProvider: NetworkProvider { get }
}
