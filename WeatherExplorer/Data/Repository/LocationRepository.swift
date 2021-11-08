//
//  SuggestionRepository.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation

class LocationRepository: Repository {

    var dbManager: DataManager

    init(dataManager: DataManager = RealmDataManager(RealmDatabaseProvider.shared)) {
        self.dbManager = dataManager
    }

    func lastSearched(location: String, completionHandler: ([Location]) -> Void) {

        let nameStartsWith = NSPredicate(format: "name BEGINSWITH %@", location)

        fetch(LocationDTO.self, predicate: nameStartsWith) { locations in
            let lastSearchLocations = locations.map { Location.mapFromPersistenceObject($0) }
            completionHandler(lastSearchLocations)
        }
    }

    func lastSearchedLocations(completionHandler: ([Location]) -> Void) {
        fetch(LocationDTO.self, predicate: nil) { locations in
            let lastSearchLocations = locations.map { Location.mapFromPersistenceObject($0) }
            completionHandler(lastSearchLocations)
        }
    }

    func save(location: Location) {
        do {
            try save(object: location.mapToPersistenceObject())
        } catch {
            print(error.localizedDescription)
        }
    }
}
