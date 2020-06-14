//
//  TranslateViewController.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslateViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var textField: TextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Public Properties

    var output: TranslateViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.output?.viewDidLoad()
    }
}

// MARK: - TranslateViewInput

extension TranslateViewController: TranslateViewInput {

    func configure() {
        view.backgroundColor = UIColor.Translate.lightBlue
        configureViews()
    }

    func setErrorViews(errorText: String?) {
        if let text = errorText,
            !text.isEmpty {
            errorLabel.text = text
            collectionView.isHidden = true
        } else {
            collectionView.isHidden = false
            errorLabel.text = ""
        }
    }

    func setData(with word: Word) {
        
    }

    func setDescriptionLabel(text: String) {
        descriptionLabel.text = text
    }
}

// MARK: - Private Methods

private extension TranslateViewController {

    func configureViews() {
        configureTextField()
        configureLabels()
        configureCollection()
    }

    func configureTextField() {
        textField.didChangeText = { [weak self] text in
            self?.output?.textFieldDidChange(with: text)
        }
    }

    func configureLabels() {
        errorLabel.textColor = UIColor.Translate.red
        errorLabel.text = ""

        descriptionLabel.text = ""
    }

    func configureCollection() {
        collectionView.backgroundColor = .clear
    }
}
