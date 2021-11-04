//
//  SuggestionsTableViewControllerTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import XCTest
@testable import WeatherExplorer

class SuggestionsTableViewControllerTest: XCTestCase {

    var sut: SuggestionsTableViewController!

    override func setUp() {
        super.setUp()

        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "suggestions") as? SuggestionsTableViewController

        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController!)
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

    // TODO: Replace by Real Database Implementation
    func suggestions() -> [Suggestion] {
        return [
            Suggestion(name: "Recife", country: "Brazil", region: "Pernambuco"),
            Suggestion(name: "Rondonia", country: "Brazil", region: "Pernambuco"),
            Suggestion(name: "Porto", country: "Portugal", region: "Porto"),
            Suggestion(name: "Dublin", country: "Ireland", region: "Dublin")
        ]
    }
}
