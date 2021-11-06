//
//  Repository.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 06/11/2021.
//

import Foundation

protocol Repository {
    var dbManager: DataManager { get }
}

extension Repository {
    func update(object: Storable) throws {
        try dbManager.update(object: object)
    }

    func save(object: Storable) throws {
        try dbManager.save(object: object)
    }

    func delete(object: Storable) throws {
        try dbManager.delete(object: object)
    }

    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, completion: (([T]) -> Void)) where T: Storable {
        dbManager.fetch(model, predicate: predicate, completion: completion)
    }
}
