//
//  TranslateViewController.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class TranslateViewController: UIViewController {

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
    }
}
