//
//  JsonDataPaser.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

struct JsonDataParser: DataParser {

    func process<T>(data: Data, _ completion: @escaping (Result<T, ParserError>) -> Void) where T: Decodable, T: Encodable {
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(parsedData))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
