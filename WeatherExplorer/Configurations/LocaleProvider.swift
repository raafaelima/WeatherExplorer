//
//  LocaleProvider.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

struct LocaleProvider {
    static func conversionUnit() -> String {
        return Locale.current.usesMetricSystem ? "m" : "f"
    }
}
