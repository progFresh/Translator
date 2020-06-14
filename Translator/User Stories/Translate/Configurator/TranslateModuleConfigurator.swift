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

    func configure() -> UIViewController {

        let name = String(describing: TranslateViewController.self)
        let controller = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()

        guard let view = controller as? TranslateViewController else {
            fatalError("Can't load \(name) from storyboard, check that controller is initial view controller")
        }

//        let presenter = ProductHistoryDetailPresenter(model: model)
//        let router = ProductHistoryDetailRouter()
//
//        presenter.view = view
//        presenter.router = router
//        presenter.output = output
//        router.view = view
//        view.output = presenter

        return view
    }
}
