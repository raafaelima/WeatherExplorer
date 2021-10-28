//
//  CacheManagerMock.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

@testable import CountryExplorer

class CacheManagerMock: CacheManager {

    var storageManager: StorageManager = FileStorageManager()

    var didCallLoad = false
    var didCallSave = false
    var mockData = Data()

    func load() -> Data {
        didCallLoad = true
        return mockData
    }

    func save(onCache data: Data) {
        didCallSave = true
    }
}
