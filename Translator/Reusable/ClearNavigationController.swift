//
//  ClearNavigationController.swift
//  Translator
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class ClearNavigationController: UINavigationController {

    // MARK: - Lifecycle

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        self.delegate = self
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        navigationBar.isTranslucent = true
        navigationBar.barStyle = .blackTranslucent
        navigationBar.barTintColor = .clear

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        let backImage = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }
}

extension ClearNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        UIView.performWithoutAnimation {
            let barButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController.topViewController?.navigationItem.backBarButtonItem = barButton
        }
    }

}

