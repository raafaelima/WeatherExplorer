//
//  MainCoordinator.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LocationExplorerViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func details(of location: Location) {
        let vc = LocationDetailViewController.instantiate()
        vc.location = location
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
