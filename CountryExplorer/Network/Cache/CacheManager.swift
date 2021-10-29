//
//  CacheManager.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol CacheManager {

    var storageManager: StorageManager { get }

    func load() -> Data
    func save(onCache data: Data)
}
