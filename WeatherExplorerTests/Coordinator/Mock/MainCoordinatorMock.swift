//
//  MainCoordinatorMock.swift
//  WeatherExplorerTests
//
//  Created by CTW00710-Admin on 04/11/2021.
//

import Foundation

@testable import WeatherExplorer

class MainCoordinatorMock: MainCoordinator {

    var didCallStart = false
    var didCallDetails = false

    override func start() {
        self.didCallStart = true
    }

    override func details(of location: Location) {
        self.didCallDetails = true
    }
}
