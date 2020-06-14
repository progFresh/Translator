//
//  Translation.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct Translation {
    let text: String
    let note: String?
}

// MARK: - DTOConvertible

extension Translation: DTOConvertible {
    public typealias DTO = TranslationEntry

    public static func from(dto entry: Translation.DTO) throws -> Translation {
        return Translation(text: entry.text, note: entry.note)
    }

    public func toDTO() throws -> Translation.DTO {
        return TranslationEntry(text: self.text, note: self.note)
    }
}

