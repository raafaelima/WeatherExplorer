//
//  DataParser.swift
//  CountryExplorer
//
//  Created by CTW00710-Admin on 28/10/2021.
//

import Foundation

protocol DataParser {
    func process<T: Codable>(data: Data, _ completion: @escaping (Result<T, ParserError>) -> Void)
}
