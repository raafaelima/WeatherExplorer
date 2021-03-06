//
//  Mappable.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 06/11/2021.
//

import Foundation
import RealmSwift

protocol Mappable {

    associatedtype PersistenceType: Storable

    func mapToPersistenceObject() -> PersistenceType
    static func mapFromPersistenceObject(_ object: PersistenceType) -> Self
}
