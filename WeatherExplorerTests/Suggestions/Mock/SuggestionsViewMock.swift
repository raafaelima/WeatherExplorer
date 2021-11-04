//
//  SuggestionsViewMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import Foundation
@testable import WeatherExplorer

class SuggestionsViewMock: SuggestionsView {

    var didCallPresent = false
    var dataset: [Location] = []

    func present(_ suggestions: [Location]) {
        didCallPresent = true
        dataset = suggestions
    }
}
