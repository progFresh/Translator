//
//  TranslatePresenter.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslatePresenter {

    // MARK: - Constants

    private enum Constants {
        static let loadingPage = "1"
    }

    // MARK: - Public Properties

    weak var view: TranslateViewInput?

    // MARK: - Init

    init(delayer: TaskDelayer) {
        self.delayer = delayer
    }

    // MARK: - Private Properties

    private let delayer: TaskDelayer
}

// MARK: - TranslateViewOutput

extension TranslatePresenter: TranslateViewOutput {

    func viewDidLoad() {
        view?.configure()
    }

    func textFieldDidChange(with text: String) {
        guard !text.isEmpty else {
            delayer.cancel()
            return
        }

        delayer.task = { [weak self] in
            self?.loadData(word: text)
        }
        delayer.tryStart()
    }
}

// MARK: - Private Methods

private extension TranslatePresenter {

    func loadData(word: String) {
        TranslateService().getTranslation(
            word: word,
            page: Constants.loadingPage
        ).onCompleted { [weak self] value in
            print("kek")
        }.onError { [weak self] error in
            print(error)
        }
    }
}
