//
//  CacheManager.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol CacheManager {
    func load() -> Data
    func save(onCache data: Data)
}
