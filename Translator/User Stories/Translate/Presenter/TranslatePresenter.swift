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
        static let errorText = "Не удалось получить данные"
        static let descriptionText = "Введите слово на английском"
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
        view?.setDescriptionLabel(text: Constants.descriptionText)
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
            self?.handle(word: value.first)
        }.onError { [weak self] _ in
            self?.view?.setErrorViews(errorText: Constants.errorText)
        }
    }

    func handle(word: Word?) {
        guard let word = word else {
            view?.setErrorViews(errorText: Constants.errorText)
            return
        }

        view?.setErrorViews(errorText: nil)
        view?.setData(with: word)
    }
}
