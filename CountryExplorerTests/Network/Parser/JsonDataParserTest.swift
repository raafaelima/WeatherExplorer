//
//  JsonDataParserTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation
import XCTest

@testable import CountryExplorer

class JsonDataParserTest: XCTestCase {

    private var sut: JsonDataParser!

    override func setUp() {
        super.setUp()
        sut = JsonDataParser()
    }

    func testShouldReturnDataParsingErrorWhenDataIsEmpty() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "".data(using: .utf8)

        sut.process(data: mockData!) { (result: Result<CountriesResponse, ParserError>) in
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

        sut.process(data: mockData!) { (result: Result<CountriesResponse, ParserError>) in
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

        let sampleProfileData = JSONHelper.getObjectFrom(json: "country", type: CountriesResponse.self)!
        let mockData = try JSONEncoder().encode(sampleProfileData)

        sut.process(data: mockData) { (result: Result<CountriesResponse, ParserError>) in
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

        sut.process(data: mockData) { (result: Result<[CountriesResponse], ParserError>) in
            switch result {
            case .success(let countries):
                XCTAssertEqual(countries.count, 2)
                XCTAssertEqual(countries[0].name, "Brazil")
                XCTAssertEqual(countries[1].name, "Portugal")
                expectation.fulfill()
            default:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

}
