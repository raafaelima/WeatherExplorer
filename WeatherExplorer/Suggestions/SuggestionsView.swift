//
//  SuggestionsView.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 03/11/2021.
//

import Foundation

protocol SuggestionsView: AnyObject {
    func present(_ suggestions: [Suggestion])
}
