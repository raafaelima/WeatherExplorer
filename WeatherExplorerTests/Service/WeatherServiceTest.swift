//
//  WeatherServiceTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest
@testable import WeatherExplorer

class WeatherServiceTest: XCTestCase {

    var sut: WeatherService!

    private let dataParserMock = JsonDataParserMock()
    private let cacheManagerMock = CacheManagerMock()
    private let  networkProviderMock = URLSessionNetworkProviderMock()

    override func setUp() {
        super.setUp()
        sut = WeatherService(dataParser: dataParserMock, cacheManager: cacheManagerMock, networkProvider: networkProviderMock)
    }

    func testServiceReturnListWhenTheDataIsValid() throws {

        let expectation = XCTestExpectation(description: "response")

        sut.currentWeatherFrom(city: "Recife") { location in
            XCTAssertEqual(location.name, "Recife")
            XCTAssertEqual(location.country, "Brazil")
            XCTAssertEqual(location.region, "Pernambuco")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceSaveDataOfLastRequestOnCache() throws {

        let expectation = XCTestExpectation(description: "response")

        sut.currentWeatherFrom(city: "Recife") { _ in
            XCTAssertTrue(self.cacheManagerMock.didCallSave)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceLoadDataFromCacheWhenInternetIsUnreachable() throws {

        let expectation = XCTestExpectation(description: "response")

        networkProviderMock.forceError = true

        sut.currentWeatherFrom(city: "Recife") { location in
            XCTAssertEqual(location.name, "Recife")
            XCTAssertTrue(self.cacheManagerMock.didCallLoad)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceReturnEmptyArrayWhenParseIsError() throws {

        let expectation = XCTestExpectation(description: "response")

        dataParserMock.forceError = true

        sut.currentWeatherFrom(city: "Recife") { location in
            XCTAssertTrue(location.name.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
