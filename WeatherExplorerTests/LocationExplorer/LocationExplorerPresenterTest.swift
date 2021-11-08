//
//  LocationExplorerPresenterTest.swift
//  WeatherExplorerTests
//
//  Created by CTW00710-Admin on 08/11/2021.
//

import XCTest
@testable import WeatherExplorer

class LocationExplorerPresenterTest: XCTestCase {

    private var sut: LocationExplorerPresenter!
    private var serviceMock: WeatherServiceMock!
    private var delegateMock: LocationExplorerViewMock!
    private var repositoryMock: LocationRepositoryMock!

    override func setUp() {
        super.setUp()
        serviceMock = WeatherServiceMock()
        delegateMock = LocationExplorerViewMock()
        repositoryMock = LocationRepositoryMock()
        sut = LocationExplorerPresenter(delegate: delegateMock, service: serviceMock, repository: repositoryMock)
    }

    func testPresenterShouldCallServiceWhenThereIsNoDataSavedThatMatchTheQuery() throws {
        repositoryMock.forceError = true

        sut.currentWeather(of: "Recife")

        let exp = expectation(description: "Test after 2 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(serviceMock.didCallFetchData)
            XCTAssertTrue(delegateMock.didCallPresentWeather)
            exp.fulfill()
        } else {
            XCTFail()
        }
    }

    func testPresenterShouldNotCallServiceWhenThereIsDataSavedThatMatchTheQuery() throws {

        sut.currentWeather(of: "Recife")

        let exp = expectation(description: "Test after 2 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(serviceMock.didCallFetchData)
            XCTAssertTrue(delegateMock.didCallPresentWeather)
            XCTAssertTrue(repositoryMock.didCallFetchLocationWith)
            exp.fulfill()
        } else {
            XCTFail()
        }
    }

    func testPresenterShouldShowErrorWhenDatabaseDoNotHaveTheLocationRequested() throws {

        repositoryMock.forceError = true
        serviceMock.forceError = true

        sut.currentWeather(of: "Recife")

        let exp = expectation(description: "Test after 2 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(delegateMock.didCallShowNoWeatherForLocation)
            exp.fulfill()
        } else {
            XCTFail()
        }
    }

    func testLastSearchedDataShouldBePresented() throws {

        sut.lastSearchedLocations()

        let exp = expectation(description: "Test after 2 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2)

        if result == XCTWaiter.Result.timedOut {
            exp.fulfill()
            XCTAssertTrue(delegateMock.didCallPresentLastSearched)
            XCTAssertEqual(delegateMock.locations.count, 4)
        } else {
            XCTFail()
        }
    }
}
