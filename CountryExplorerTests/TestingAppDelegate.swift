//
//  TestingAppDelegate.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import UIKit

@objc(TestingAppDelegate)
final class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
            for sceneSession in application.openSessions {
                application.perform(Selector(("_removeSessionFromSessionSet:")), with: sceneSession)
            }
        } else {
            window = UIWindow()
            window?.rootViewController = TestingRootViewController()
            window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = TestingSceneDelegate.self
        sceneConfiguration.storyboard = nil

        return sceneConfiguration
    }
}
