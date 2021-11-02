//
//  CurrentWeatherResponseTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

import XCTest

@testable import WeatherExplorer

class CurrentWeatherResponseTest: XCTestCase {

    var sut: CurrentWeatherResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "current", type: CurrentWeatherResponse.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.temperature, 28)
        XCTAssertEqual(sut.feelslike, 32)
        XCTAssertEqual(sut.weatherDescriptions.first, "Partly cloudy")
    }
}
