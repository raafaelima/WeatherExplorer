//
//  Storyboarded+Instanciate.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 04/11/2021.
//

import UIKit

extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
