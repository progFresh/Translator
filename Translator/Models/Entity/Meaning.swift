//
//  Meaning.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct Meaning {
    let translation: Translation
}

// MARK: - DTOConvertible

extension Meaning: DTOConvertible {
    public typealias DTO = MeaningEntry

    public static func from(dto entry: Meaning.DTO) throws -> Meaning {
        return Meaning(translation: try .from(dto: entry.translation))
    }

    public func toDTO() throws -> Meaning.DTO {
        return MeaningEntry(translation: try self.translation.toDTO())
    }
}

