//
//  WordEntry.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct WordEntry: Codable {
    let text: String
    let meanings: [MeaningEntry]
}

// MARK: - RawMappable

extension WordEntry: RawMappable {
    typealias Raw = Json
}

