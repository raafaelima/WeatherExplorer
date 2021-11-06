//
//  DataManager.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 06/11/2021.
//

import Foundation

protocol DataManager {
    func save(object: Storable) throws
    func update(object: Storable) throws
    func delete(object: Storable) throws
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, completion: (([T]) -> Void))
}
