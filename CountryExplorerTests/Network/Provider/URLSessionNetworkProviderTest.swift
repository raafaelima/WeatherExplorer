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

    private let endpoint: Endpoint = DummyEndpoint()
    private let reachabilityMock = ReachabilityMock()

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        mockSession = URLSession(configuration: configuration)
        sut = URLSessionNetworkProvider(session: mockSession, reachability: reachabilityMock)
    }

    func testShouldReturnValidData() throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), Data())
        }

        sut.requestData(from: endpoint) { (result: Result<Data, ApiError>) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnEmptyDataErrorWhenThereIsNoResponseFromServer() throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), nil)
        }

        sut.requestData(from: endpoint) { (result: Result<Data, ApiError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .emptyData)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReadDataFromCacheWhenInternetIsNotAvailable() throws {

        let expectation = XCTestExpectation(description: "response")

        reachabilityMock.forceError = true

        sut.requestData(from: endpoint) { (result: Result<Data, ApiError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .notReachable)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }
}
