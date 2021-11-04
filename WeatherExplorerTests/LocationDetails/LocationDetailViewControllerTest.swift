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
        sut.location = mockLocation()

        _ = sut.view
        sut.viewDidLoad()
    }

    func testViewDidLoadLoadTheCoordinator() throws {
        XCTAssertNotNil(sut.coordinator)
    }

    func testViewDidLoadLoadTheLocation() throws {
        XCTAssertNotNil(sut.location)
    }

    func testLocationLabelHasCorrectData() throws {
        XCTAssertEqual(sut.cityLabel.text, "Recife")
    }

    func testTemperatureLabelHasCorrectData() throws {
        XCTAssertEqual(sut.temperatureLabel.text, "28˚")
    }

    func testWeatherLabelHasCorrectData() throws {
        XCTAssertEqual(sut.weatherStatusLabel.text, "Partly cloudy")
    }

    func testFeelsLikeLabelHasCorrectData() throws {
        XCTAssertEqual(sut.feelsLikeLabel.text, "Feels Like: 32˚")
    }

    private func mockLocation() -> Location {
        let weather = Weather(temperature: 28, feelsLike: 32, descriptions: ["Partly cloudy"])
        return Location(name: "Recife", country: "Brazil", region: "Pernambuco", latitude: 0.0, longitude: 0.0, weather: weather)
    }
}
