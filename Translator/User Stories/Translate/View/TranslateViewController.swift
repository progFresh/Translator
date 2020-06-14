//
//  TranslateViewController.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

final class TranslateViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let minimumInteritemSpacing = CGFloat(8)
        static let minimumLineSpacing = CGFloat(8)
        static let sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 85, right: 15)
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var textField: TextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Public Properties

    var output: TranslateViewOutput?

    // MARK: - Private Properties

    private var adapter: MeaningsCollectionViewAdapter?

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

    func setData(with meanings: [Meaning]) {
        setupAdapter(meanings: meanings)
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
        collectionView.delaysContentTouches = false
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(
            horizontalAlignment: .left,
            verticalAlignment: .center
        )
        alignedFlowLayout.minimumInteritemSpacing = Constants.minimumInteritemSpacing
        alignedFlowLayout.minimumLineSpacing = Constants.minimumLineSpacing
        alignedFlowLayout.sectionInset = Constants.sectionInset
        collectionView.collectionViewLayout = alignedFlowLayout
    }

    private func setupAdapter(meanings: [Meaning]) {
        let adapter = initAdapter(meanings: meanings)
        collectionView.dataSource = adapter
        collectionView.delegate = adapter
        collectionView.reloadData()
        self.adapter = adapter
    }

    private func initAdapter(meanings: [Meaning]) -> MeaningsCollectionViewAdapter {
        let adapter = MeaningsCollectionViewAdapter(collectionView: collectionView, meanings: meanings)
        return adapter
    }
}
