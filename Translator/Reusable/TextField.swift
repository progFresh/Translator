//
//  TextField.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TextField: UITextField {

    // MARK: - Public Properties

    var didChangeText: ((String) -> Void)?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

// MARK: - UITextFieldDelegate

extension TextField: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(
                in: textRange,
                with: string
            )
            didChangeText?(updatedText)
        }
        return true
    }
}

// MARK: - Private Methods

private extension TextField {

    func configure() {
        delegate = self
    }
}
