//
//  LocalCacheManager.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct LocalCacheManager: CacheManager {

    var storageManager: StorageManager
    private let cacheFile = "local_cache.json"

    init(storageManager: StorageManager = FileStorageManager()) {
        self.storageManager = storageManager
    }

    func save(onCache data: Data) {
        do {
            try storageManager.save(data: data, on: cacheFile)
        } catch {
            print(error.localizedDescription)
        }
    }

    func load() -> Data {
        do {
            return try storageManager.load(from: cacheFile)
        } catch {
            return Data()
        }
    }
}
