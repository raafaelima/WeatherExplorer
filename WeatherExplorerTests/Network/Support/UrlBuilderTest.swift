//
//  UrlBuilderTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import XCTest

@testable import WeatherExplorer

class UrlBuilderTest: XCTestCase {

    var sut: URLBuilder!

    override func setUp() {
        super.setUp()
        sut = URLBuilder()
    }

    func testWhenThereAreNoParamsShouldReturnTheStandardURL() throws {
        let url = sut.build()
        XCTAssertEqual(url.host, "testhost.com")
        XCTAssertTrue(url.query!.contains("access_key"))
    }

    func testApiKeyIsFilled() throws {
        let url = sut.build()
        XCTAssertTrue(url.query!.contains("access_key=123apikey321"))
    }

    func testConversionUnitIsFilled() throws {
        let url = sut.build()
        XCTAssertTrue(url.query!.contains("units=f"))
    }

    func testVerifyURLParamsBuilder() throws {
        let dummyItem = URLQueryItem(name: "dummy", value: "thisIsADummyParam")
        let url = sut.build(with: [dummyItem])
        XCTAssertTrue(url.query!.contains("dummy=thisIsADummyParam"))
    }
}
