//
//  RealmDatabaseProvider.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 06/11/2021.
//

import Foundation
import RealmSwift

struct RealmDatabaseProvider {

    let configuration: Realm.Configuration

    internal init(config: Realm.Configuration) {
        configuration = config
    }

    private var realm: Realm? {
        do {
            return try Realm(configuration: configuration)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    static var shared: Realm? = {
        let defaultConfig = Realm.Configuration(schemaVersion: 1)
        return RealmDatabaseProvider(config: defaultConfig).realm
    }()
}
