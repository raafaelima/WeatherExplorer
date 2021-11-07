//
//  RealmDataManagerTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 07/11/2021.
//

import XCTest
import RealmSwift

@testable import WeatherExplorer

class RealmDataManagerTest: XCTestCase {

    private var sut: RealmDataManager!
    let realm = try? Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))

    override func setUp() {
        super.setUp()
        sut = RealmDataManager(realm)
    }

    func testDatabaseWillSaveAndRetrieveTheDataCorrectly() throws {

        let expectation = XCTestExpectation(description: "storedData")

        let location =  LocationDTO(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: WeatherDTO.noData)

        try sut.save(object: location)

        sut.fetch(LocationDTO.self, predicate: nil) { storedLocation in
            XCTAssertEqual(storedLocation[0].name, "Recife")
            XCTAssertEqual(storedLocation[0].country, "Brazil")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
