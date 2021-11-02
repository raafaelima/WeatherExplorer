//
//  ReachabilityMock.swift
//  WeatherExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

@testable import WeatherExplorer

class ReachabilityMock: ReachabilityType {

    var forceError: Bool = false
    var didCallStatus = false

    func currentStatus() -> ReachabilityStatus {
        didCallStatus = true
        return forceError ? .notReachable : .reachableViaWiFi
    }
}
