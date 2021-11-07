//
//  DatabaseProvider.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 07/11/2021.
//

import Foundation
import RealmSwift

protocol DatabaseProvider {
    static var shared: Realm? { get set }
}
