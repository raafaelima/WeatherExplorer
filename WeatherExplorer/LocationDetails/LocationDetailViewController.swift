//
//  LocationDetailViewController.swift
//  WeatherExplorer
//
//  Created by CTW00710-Admin on 04/11/2021.
//

import UIKit
import MapKit

class LocationDetailViewController: UIViewController, Storyboarded {

    internal var location: Location?
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
