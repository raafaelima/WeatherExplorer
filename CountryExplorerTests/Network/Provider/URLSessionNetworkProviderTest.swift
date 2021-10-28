//
//  URLSessionNetworkProviderTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation
import XCTest

@testable import CountryExplorer

class URLSessionNetworkProviderTest: XCTestCase {

    private var sut: NetworkProvider!
    private var mockSession: URLSession!
    private let endpoint: Endpoint = AllCountriesEndpoint()

    private let cacheManagerMock = CacheManagerMock()
    private let reachabilityMock = ReachabilityMock()

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        mockSession = URLSession(configuration: configuration)
        sut = URLSessionNetworkProvider(session: mockSession, reachability: reachabilityMock, cacheManager: cacheManagerMock)
    }

    func testShouldReturnEmptyDataErrorWhenThereIsNoResponseFromServer() throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), nil)
        }

        sut.requestData(from: endpoint) { (result: Result<CountriesResponse, ApiError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, ApiError.emptyData)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnDataParsingErrorWhenDataIsEmpty() throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), "".data(using: .utf8))
        }

        sut.requestData(from: endpoint) { (result: Result<CountriesResponse, ApiError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, ApiError.dataParsing)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnDataParsingErrorWhenDataIsWrong() throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), "[{\"dummy\":\"dummy\"}]".data(using: .utf8))
        }

        sut.requestData(from: endpoint) { (result: Result<CountriesResponse, ApiError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, ApiError.dataParsing)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnValidDataWhenServerRespondAValidJson() throws {

        let expectation = XCTestExpectation(description: "response")

        let sampleProfileData = JSONHelper.getObjectFrom(json: "country", type: CountriesResponse.self)!
        let mockData = try JSONEncoder().encode(sampleProfileData)

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), mockData)
        }

        sut.requestData(from: endpoint) { (result: Result<CountriesResponse, ApiError>) in
            switch result {
            case .success(let country):
                XCTAssertEqual(country.name, "Portugal")
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnValidDataArrayWhenServerRespondAValidJson() throws {

        let expectation = XCTestExpectation(description: "response")

        let sampleProfileData = JSONHelper.getObjectFrom(json: "countries", type: [CountriesResponse].self)!
        let mockData = try JSONEncoder().encode(sampleProfileData)

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), mockData)
        }

        sut.requestData(from: endpoint) { (result: Result<[CountriesResponse], ApiError>) in
            switch result {
            case .success(let counties):
                XCTAssertEqual(counties.count, 2)
                XCTAssertEqual(counties[0].name, "Brazil")
                XCTAssertEqual(counties[1].name, "Portugal")
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReadDataFromCacheWhenInternetIsNotAvailable() throws {

        let expectation = XCTestExpectation(description: "response")

        let sampleProfileData = JSONHelper.getObjectFrom(json: "country", type: CountriesResponse.self)!
        let mockData = try JSONEncoder().encode(sampleProfileData)

        reachabilityMock.forceError = true
        cacheManagerMock.mockData = mockData

        sut.requestData(from: endpoint) { (result: Result<CountriesResponse, ApiError>) in
            switch result {
            case .success(let country):
                XCTAssertEqual(country.name, "Portugal")
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }
}
