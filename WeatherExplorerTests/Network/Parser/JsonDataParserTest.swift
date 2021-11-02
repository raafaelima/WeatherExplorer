//
//  JsonDataParserTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation
import XCTest

@testable import WeatherExplorer

class JsonDataParserTest: XCTestCase {

    private var sut: JsonDataParser!

    override func setUp() {
        super.setUp()
        sut = JsonDataParser()
    }

    func testShouldReturnDataParsingErrorWhenDataIsEmpty() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "".data(using: .utf8)

        sut.process(data: mockData!) { (result: Result<WeatherResponse, ParserError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .invalidData)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnDataParsingErrorWhenDataIsWrong() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "[{\"dummy\":\"dummy\"}]".data(using: .utf8)

        sut.process(data: mockData!) { (result: Result<WeatherResponse, ParserError>) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .invalidData)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnValidDataWhenServerRespondAValidJson() throws {

        let expectation = XCTestExpectation(description: "response")

        let sampleProfileData = JSONHelper.getObjectFrom(json: "weather", type: WeatherResponse.self)!
        let mockData = try JSONEncoder().encode(sampleProfileData)

        sut.process(data: mockData) { (result: Result<WeatherResponse, ParserError>) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.location.name, "Recife")
                XCTAssertEqual(response.weather.temperature, 28)
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }
}
