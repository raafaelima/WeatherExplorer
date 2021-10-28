//
//  StorageManager.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

protocol StorageManager: AnyObject {
    func save(data: Data, on key: String) throws
    func load(from key: String) throws -> Data
}
