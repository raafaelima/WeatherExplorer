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
    @IBOutlet weak var map: MKMapView!

    internal var location: Location?
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("detailsTitle", comment: "")
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

        map.layer.cornerRadius = 10
        centerMap(on: locationWeather)
    }

    private func centerMap(on location: Location) {
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(coordinateRegion, animated: true)
        addMapPin(on: location)
    }

    private func addMapPin(on location: Location) {
        let annotation = MKPointAnnotation()
        annotation.title = "\(location.name), \(location.region) - \(location.country)"
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        map.addAnnotation(annotation)
    }
}
