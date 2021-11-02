//
//  URLSession+Pinning.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import Foundation

extension URLSession {
    static var pinning: URLSession {
        URLSession(configuration: .ephemeral, delegate: NSURLSessionPinningDelegate(), delegateQueue: nil)
    }
}
