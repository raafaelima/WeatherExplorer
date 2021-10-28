//
//  ApiError.swift
//  CountryExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

enum ApiError: Error {
    case urlCreation
    case dataParsing
    case emptyData
    case apiFailure
}
