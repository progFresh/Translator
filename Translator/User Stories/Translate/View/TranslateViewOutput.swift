//
//  TranslateViewOutput.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

protocol TranslateViewOutput {
    func viewDidLoad()
    func textFieldDidChange(with text: String)
    func touched(meaning: Meaning)
}
