//
//  WordEntry.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct TranslationEntry: Codable {
    let text: String
    let note: String?
}

// MARK: - RawMappable

extension TranslationEntry: RawMappable {
    typealias Raw = Json
}

