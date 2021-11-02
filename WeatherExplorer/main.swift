//
//  main.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 28/10/2021.
//

import UIKit

// If we have a TestingAppDelegate (i.e. we're running unit tests), use that to avoid executing initialisation code in AppDelegate
// TheTestingAppDelegate class will only exist when running unit tests
let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
