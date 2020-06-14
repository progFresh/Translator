//
//  MeaningCell.swift
//  Translator
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

class MeaningCell: UICollectionViewCell {

    // MARK: - Constants

    private enum Constants {
        static let cornerRadius: CGFloat = 5
        static let labelFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - AwakeFromNib

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    // MARK: - Public Methods

    func configure(with meaning: Meaning) {
        titleLabel.text = meaning.translation.text
    }

}

// MARK: - Private Methods

private extension MeaningCell {

    func setupCell() {
        backgroundColor = .clear
        backView.layer.cornerRadius = Constants.cornerRadius
        backView.layer.masksToBounds = true
        titleLabel.font = Constants.labelFont
    }
}
