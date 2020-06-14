//
//  TranslateRouter.swift
//  Translator
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslateRouter {

    // MARK: - Public Properties

    weak var view: ModuleTransitionable?
}

// MARK: - MeaningDetailsRouterInput

extension TranslateRouter: TranslateRouterInput {

    func showDetails(with meaning: Meaning) {
        let vc = MeaningDetailsModuleConfigurator().configure()
        view?.showModule(vc)
    }
}

