//
//  RealmDataManager.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 06/11/2021.
//

import Foundation
import RealmSwift

class RealmDataManager: DataManager {

    private let realm: Realm?

    init(_ realm: Realm?) {
        self.realm = realm
    }

    func save(object: Storable) throws {
        guard let database = realm, let object = object as? Object else { throw RealmError.realmIsNil }
        try database.write {
            database.add(object)
        }
    }

    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, completion: (([T]) -> Void)) where T: Storable {
        guard let database = realm, let model = model as? Object.Type else { return }

        var objects = database.objects(model)

        if let predicate = predicate {
            objects = objects.filter(predicate)
        }

        let parsedData = objects.isEmpty ? [] : objects.compactMap { $0 as? T }
        completion(parsedData)
    }
}

enum RealmError: Error {
    case realmIsNil
}
