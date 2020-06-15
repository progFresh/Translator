//
//  MeaningEntry.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct MeaningEntry: Codable {
    let translation: TranslationEntry
    let imageUrl: String?
}

// MARK: - RawMappable

extension MeaningEntry: RawMappable {
    typealias Raw = Json
}
