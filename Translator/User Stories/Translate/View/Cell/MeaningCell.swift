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
        static let cornerRadius: CGFloat = 10
        static let labelFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Public Properties

    var onCellTouch: ((Meaning) -> Void)?

    // MARK: - Private Properties

    private let tapControl = TouchableControl(frame: .zero)
    private var meaning: Meaning?

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tapControl.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
    }

    // MARK: - Public Methods

    func configure(with meaning: Meaning) {
        titleLabel.text = meaning.translation.text
        self.meaning = meaning
    }

}

// MARK: - Private Methods

private extension MeaningCell {

    func setupCell() {
        backgroundColor = .clear
        backView.layer.cornerRadius = Constants.cornerRadius
        backView.layer.masksToBounds = true
        titleLabel.font = Constants.labelFont

        addSubview(tapControl)
        tapControl.animatingViewsByAlpha = [backView]
        tapControl.onTouchUpInside = { [weak self] in
            if let meaning = self?.meaning {
                self?.onCellTouch?(meaning)
            }
        }
    }
}
