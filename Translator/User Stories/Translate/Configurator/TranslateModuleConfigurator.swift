//
//  TranslateModuleConfigurator.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslateModuleConfigurator {

    // MARK: - Public Methods

    func configure() -> UINavigationController {

        let name = String(describing: TranslateViewController.self)
        let controller = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()

        guard let view = controller as? TranslateViewController else {
            fatalError("Can't load \(name) from storyboard, check that controller is initial view controller")
        }

        let presenter = TranslatePresenter(delayer: TaskDelayer(delay: 0.5))
        let router = TranslateRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return ClearNavigationController(rootViewController: view)
    }
}
