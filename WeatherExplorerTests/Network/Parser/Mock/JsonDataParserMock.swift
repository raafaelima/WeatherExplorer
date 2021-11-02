//
//  JsonDataParserMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation
@testable import WeatherExplorer

class JsonDataParserMock: DataParser {

    var forceError: Bool = false

    func process<T: Codable>(data: Data, _ completion: @escaping (Result<T, ParserError>) -> Void) {
        if forceError {
            completion(.failure(.invalidData))
        } else {
            let response = JSONHelper.getObjectFrom(json: "countries", type: T.self)!
            completion(.success(response))
        }
    }

}
