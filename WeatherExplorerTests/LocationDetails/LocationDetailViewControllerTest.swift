//
//  LocationDetailViewControllerTest.swift
//  WeatherExplorerTests
//
//  Created by CTW00710-Admin on 04/11/2021.
//

import XCTest
@testable import WeatherExplorer

class LocationDetailViewControllerTest: XCTestCase {

    private var coordinatorMock: MainCoordinatorMock!
    private var sut: LocationDetailViewController!

    override func setUp() {
        super.setUp()

        self.coordinatorMock = MainCoordinatorMock(navigationController: UINavigationController())

        let mainViewController = LocationDetailViewController.instantiate()
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController)

        sut = mainViewController
        sut.coordinator = coordinatorMock
        sut.location = Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: Weather.noData)

        _ = sut.view
    }

    func testViewDidLoadLoadTheCoordinator() throws {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.coordinator)
    }

    func testViewDidLoadLoadTheLocation() throws {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.location)
    }
}
