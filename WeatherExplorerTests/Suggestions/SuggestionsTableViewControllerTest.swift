//
//  SuggestionsTableViewControllerTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import XCTest
@testable import WeatherExplorer

class SuggestionsTableViewControllerTest: XCTestCase {

    private var sut: SuggestionsTableViewController!

    override func setUp() {
        super.setUp()

        let mainViewController = SuggestionsTableViewController.instantiate()
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController)

        sut = mainViewController
        sut.suggestionsDataSet = suggestions()

        _ = sut.view
    }

    func testViewDidLoadLoadThePresenter() throws {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.suggestionsPresenter)
    }

    func testCollectionViewHaveTheCorrectAmmountOfRows() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 4)
    }

    func testCollectionViewHaveTheCorrectAmmountOfSections() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }

    func testCollectionViewHaveTheCorrectCellAtIndex() throws {
        sut.viewDidLoad()

        sut.tableView.numberOfRows(inSection: 0)

        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))!

        XCTAssertEqual(cell.textLabel!.text, "Recife")
        XCTAssertEqual(cell.detailTextLabel!.text, "Pernambuco, Brazil")
    }

    func testPrepareNavigateTheLocationDetailsVC() throws {
        let mockCoordinator = MainCoordinatorMock(navigationController: UINavigationController())
        sut.coordinator = mockCoordinator

        sut.tableView.numberOfRows(inSection: 0)
        sut.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)

        XCTAssertNotNil(mockCoordinator.didCallDetails)
    }

    // TODO: Replace by Real Database Implementation
    func suggestions() -> [Location] {
        return [
            Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Rondonia", country: "Brazil", region: "Roraima", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Porto", country: "Portugal", region: "Porto", latitude: 0.0, longitude: 0.0, weather: Weather.noData),
            Location(name: "Dublin", country: "Ireland", region: "Dublin", latitude: 0.0, longitude: 0.0, weather: Weather.noData)
        ]
    }
}
