//
//  LocationRepositoryTest.swift
//  WeatherExplorerTests
//
//  Created by CTW00710-Admin on 07/11/2021.
//

import XCTest
import RealmSwift

@testable import WeatherExplorer

class LocationRepositoryTest: XCTestCase {

    private var sut: LocationRepository!

    override func setUp() {
        super.setUp()
        let realm = try? Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))
        let dataManager = RealmDataManager(realm)
        sut = LocationRepository(dataManager: dataManager)
    }

    func testDatabaseWillRetrieveTheCorrectLocationsThatMatchTheSearch() throws {

        let expectation = XCTestExpectation(description: "storedData")

        let recife =  Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
        let rondonia =  Location(name: "Rondonia", country: "Brazil", region: "Roraima", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
        let dublin =  Location(name: "Dublin", country: "Ireland", region: "Dublin", latitude: 0.0, longitude: 0.0, weather: Weather.noData)

        sut.save(location: recife)
        sut.save(location: rondonia)
        sut.save(location: dublin)

        sut.lastSearched(location: "R") { matchLocations in
            XCTAssertEqual(matchLocations.count, 2)
            XCTAssertEqual(matchLocations[0].name, "Recife")
            XCTAssertEqual(matchLocations[1].name, "Rondonia")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

}
