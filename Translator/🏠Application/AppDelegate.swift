//
//  AppDelegate.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Constants

    private enum Constants {
        static let transitionDuration: TimeInterval = 0.5
    }

    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        UIView.transition(with: window, duration: 0.2, options: .transitionFlipFromRight, animations: {
            window.rootViewController = TranslateModuleConfigurator().configure()
            window.makeKeyAndVisible()
        })
        return true
    }

}

