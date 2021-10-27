//
//  AppConfigurationTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest

@testable import CountryExplorer

class AppConfigurationTest: XCTestCase {

    func testHostIsFilled() throws {
        let host = AppConfiguration.shared.host
        XCTAssertEqual(host, "http://testhost.com/v2")
    }

    func testApiKeyIsFilled() throws {
        let apiKey = AppConfiguration.shared.apiKey
        XCTAssertEqual(apiKey, "123apikey321")
    }

    func testPrivateContentTypeIsFilled() throws {
        let contentType = AppConfiguration.shared.contentType
        XCTAssertEqual(contentType, "application/json")
    }
}
