//
//  LocationDetailViewController.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit
import MapKit

class LocationDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!

    internal var location: Location?
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromLocation()
    }

    private func loadDataFromLocation() {
        guard let locationWeather = location else {
            return
        }

        cityLabel.text = locationWeather.name
        temperatureLabel.text = locationWeather.weather.temperatureWithIndicator()

        let feelsLikeDescriptor = NSLocalizedString("feelsLikeDescriptor", comment: "")
        feelsLikeLabel.text = feelsLikeDescriptor + locationWeather.weather.feelsLikeWithIndicator()

        weatherStatusLabel.text = locationWeather.weather.descriptions.first ?? ""
    }
}
