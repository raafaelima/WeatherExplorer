//
//  URLBuilder.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation
import CryptoKit

protocol URLBuilding {
    func build(to path: String, with params: [URLQueryItem]) -> URL
}

struct URLBuilder: URLBuilding {

    func build(to path: String = "", with params: [URLQueryItem] = []) -> URL {
        let host = AppConfiguration.shared.host
        var components = URLComponents(string: host + path)
        components?.queryItems = baseRequestQueryItens()
        components?.queryItems?.append(contentsOf: params)
        return (components?.url)!
    }

    private func baseRequestQueryItens() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "access_key", value: apiKey())
        ]
    }

    private func apiKey() -> String {
        return AppConfiguration.shared.apiKey
    }
}
