//
//  DataManager.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 06/11/2021.
//

import Foundation

protocol DataManager {
    func save(object: Storable) throws
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, completion: (([T]) -> Void))
}
