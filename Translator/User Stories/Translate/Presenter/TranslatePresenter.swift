//
//  TranslatePresenter.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslatePresenter {

    // MARK: - Public Properties

    weak var view: TranslateViewInput?
}

// MARK: - TranslateViewOutput

extension TranslatePresenter: TranslateViewOutput {

    func viewDidLoad() {
        view?.configure()
    }
}
