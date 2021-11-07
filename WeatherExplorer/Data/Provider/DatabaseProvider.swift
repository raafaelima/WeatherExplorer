//
//  DatabaseProvider.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 07/11/2021.
//

import Foundation
import RealmSwift

protocol DatabaseProvider {
    static var shared: Realm? { get set }
}
