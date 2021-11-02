//
//  LocationResponseTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 02/11/2021.
//

import Foundation

import XCTest

@testable import WeatherExplorer

class LocationResponseTest: XCTestCase {

    var sut: LocationResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "location", type: LocationResponse.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.name, "Recife")
        XCTAssertEqual(sut.country, "Brazil")
        XCTAssertEqual(sut.region, "Pernambuco")
        XCTAssertEqual(sut.latitude, "-8.050")
        XCTAssertEqual(sut.longitude, "-34.900")
    }
}
