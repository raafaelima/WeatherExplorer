//
//  AllCountriesServiceTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest
@testable import CountryExplorer

class AllCountriesServiceTest: XCTestCase {

    var sut: AllCountriesService!

    private let mockEndpoint = DummyEndpoint()
    private let dataParserMock = JsonDataParserMock()
    private let cacheManagerMock = CacheManagerMock()
    private let  networkProviderMock = URLSessionNetworkProviderMock()

    override func setUp() {
        super.setUp()
        sut = AllCountriesService(endpoint: mockEndpoint, dataParser: dataParserMock, cacheManager: cacheManagerMock, networkProvider: networkProviderMock)
    }

    func testServiceReturnListWhenTheDataIsValid() throws {

        let expectation = XCTestExpectation(description: "response")

        sut.get { countries in
            XCTAssertEqual(countries.count, 2)
            XCTAssertEqual(countries[0].name, "Brazil")
            XCTAssertEqual(countries[1].name, "Portugal")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceSaveDataOfLastRequestOnCache() throws {

        let expectation = XCTestExpectation(description: "response")

        sut.get { _ in
            XCTAssertTrue(self.cacheManagerMock.didCallSave)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceLoadDataFromCacheWhenInternetIsUnreachable() throws {

        let expectation = XCTestExpectation(description: "response")

        networkProviderMock.forceError = true

        sut.get { countries in
            XCTAssertEqual(countries.count, 2)
            XCTAssertTrue(self.cacheManagerMock.didCallLoad)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testServiceReturnEmptyArrayWhenParseIsError() throws {

        let expectation = XCTestExpectation(description: "response")

        dataParserMock.forceError = true

        sut.get { countries in
            XCTAssertEqual(countries.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
