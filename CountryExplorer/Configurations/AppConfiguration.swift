//
//  AppConfiguration.swift
//  CountriesExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

struct AppConfiguration {
    static var shared: AppConfiguration {

        struct Static {
            static let instance = AppConfiguration()
        }

        return Static.instance
    }

    let host: String
    let apiKey: String
    let contentType: String

    private init() {
        self.host = AppConfiguration.fromBundle("Host")
        self.apiKey = AppConfiguration.fromBundle("ApiKey")
        self.contentType = AppConfiguration.fromBundle("ContentType")
    }

    private static func fromBundle(_ key: String) -> String {
        return Bundle.main.infoDictionary![key] as? String ?? ""
    }
}
