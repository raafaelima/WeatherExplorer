//
//  WeatherResponseTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

import XCTest

@testable import WeatherExplorer

class WeatherResponseTest: XCTestCase {

    var sut: WeatherResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "weather", type: WeatherResponse.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.weather.temperature, 28)
        XCTAssertEqual(sut.location.country, "Brazil")
    }
}
