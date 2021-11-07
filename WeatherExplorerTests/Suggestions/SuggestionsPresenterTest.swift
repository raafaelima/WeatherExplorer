//
//  SuggestionsPresenterTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import XCTest
@testable import WeatherExplorer

class SuggestionsPresenterTest: XCTestCase {

    private var sut: SuggestionsPresenter!
    private var delegateMock: SuggestionsViewMock!
    private var repositoryMock: LocationRepositoryMock!

    override func setUp() {
        super.setUp()
        delegateMock = SuggestionsViewMock()
        repositoryMock = LocationRepositoryMock()
        sut = SuggestionsPresenter(delegate: delegateMock, repository: repositoryMock)
    }

    func testFilterWillGetTheCorrectLocationsBasedOnQuery() throws {
        sut.lastSearched("R")

        XCTAssertTrue(delegateMock.didCallPresent)
        XCTAssertEqual(delegateMock.dataset.count, 2)
        XCTAssertEqual(delegateMock.dataset[0].name, "Recife")
        XCTAssertEqual(delegateMock.dataset[1].name, "Rondonia")
    }

    func testFilterReturnEmptyWhenThereIsNoLocationMatch() throws {
        sut.lastSearched("Lond")

        XCTAssertTrue(delegateMock.didCallPresent)
        XCTAssertEqual(delegateMock.dataset.count, 0)
    }

}
