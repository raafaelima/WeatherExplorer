//
//  FileStorageManager.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

class FileStorageManager: StorageManager {

    private let localDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    func save(data: Data, on key: String) throws {
        let cacheFile = localDir.appendingPathComponent(key)
        try data.write(to: cacheFile, options: .atomic)
    }

    func load(from key: String) throws -> Data {
        let cacheFile = localDir.appendingPathComponent(key)
        return try Data(contentsOf: cacheFile)
    }
}
