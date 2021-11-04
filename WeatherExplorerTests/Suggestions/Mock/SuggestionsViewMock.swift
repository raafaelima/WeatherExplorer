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
    var dataset: [Suggestion] = []

    func present(_ suggestions: [Suggestion]) {
        didCallPresent = true
        dataset = suggestions
    }
}
