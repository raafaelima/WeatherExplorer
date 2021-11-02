//
//  AllCountiresEndpointTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest

@testable import WeatherExplorer

class CurrentWeatherEndpointTest: XCTestCase {

    private var sut: CurrentWeatherEndpoint!

    override func setUp() {
        super.setUp()
        sut = CurrentWeatherEndpoint(city: "Recife")
    }

    func testPathWillBeFilled() throws {
        XCTAssertEqual(sut.path, "/current")
    }

    func testQueryParamsExists() throws {
        XCTAssertEqual(sut.params.count, 1)
    }

    func testQueryParamsHaveTheCorrectValue() throws {
        XCTAssertEqual(sut.params.first?.name, "query")
        XCTAssertEqual(sut.params.first?.value, "Recife")
    }
}
