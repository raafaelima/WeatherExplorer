//
//  AlertManager.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 08/11/2021.
//

import Foundation
import UIKit

struct AlertManager {

    static var shared: AlertManager {

        struct Static {
            static let instance = AlertManager()
        }

        return Static.instance
    }

    func buildAlert(with title: String, and message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(dismiss)
        return alert
    }

    func buildAlert(with title: String, message: String, action: UIAlertAction) -> UIAlertController {
        let alert = buildAlert(with: title, and: message)
        alert.addAction(action)
        return alert
    }
}
