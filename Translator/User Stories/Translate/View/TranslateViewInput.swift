//
//  TranslateViewInput.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

protocol TranslateViewInput: class {
    func configure()
    func setErrorViews(errorText: String?)
    func setData(with word: Word)
    func setDescriptionLabel(text: String)
}
