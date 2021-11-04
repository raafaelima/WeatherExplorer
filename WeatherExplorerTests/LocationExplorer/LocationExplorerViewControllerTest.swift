//
//  LocationExplorerViewControllerTest.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 04/11/2021.
//

import XCTest
@testable import WeatherExplorer

class LocationExplorerViewControllerTest: XCTestCase {

    private var coordinatorMock: MainCoordinatorMock!
    private var sut: LocationExplorerViewController!

    override func setUp() {
        super.setUp()

        self.coordinatorMock = MainCoordinatorMock(navigationController: UINavigationController())

        let mainViewController = LocationExplorerViewController.instantiate()
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController)

        sut = mainViewController
        sut.coordinator = coordinatorMock

        _ = sut.view
    }

    func testViewDidLoadLoadTheCoordinator() throws {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.coordinator)
    }
}
