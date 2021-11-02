//
//  LocaleProviderTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

import XCTest

@testable import WeatherExplorer

class LocaleProviderTest: XCTestCase {
    func testConversionUnitIsFarenheitForEnglish() throws {
        let conversionUnit = LocaleProvider.conversionUnit()
        XCTAssertEqual(conversionUnit, "f")
    }
}
