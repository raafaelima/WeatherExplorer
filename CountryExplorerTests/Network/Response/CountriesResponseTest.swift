//
//  CountriesResponseTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

import XCTest

@testable import CountryExplorer

class CountriesResponseTest: XCTestCase {

    var sut: CountriesResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "country", type: CountriesResponse.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.name, "Portugal")
        XCTAssertEqual(sut.capital, "Lisbon")
        XCTAssertEqual(sut.region, "Europe")
    }
}
