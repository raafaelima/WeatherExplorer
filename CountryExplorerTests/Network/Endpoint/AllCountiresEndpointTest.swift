//
//  AllCountiresEndpointTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest

@testable import CountryExplorer

class AllCountiresEndpointTest: XCTestCase {

    private var sut: AllCountriesEndpoint!

    override func setUp() {
        super.setUp()
        sut = AllCountriesEndpoint()
    }

    func testPathWillBeFilled() throws {
        XCTAssertEqual(sut.path, "/v2/all")
    }

    func testQueryParamsAreEmpty() throws {
        XCTAssertTrue(sut.params.isEmpty)
    }
}
