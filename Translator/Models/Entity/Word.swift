//
//  Word.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

struct Word {
    let meanings: [Meaning]
}

// MARK: - DTOConvertible

extension Word: DTOConvertible {
    public typealias DTO = WordEntry

    public static func from(dto entry: Word.DTO) throws -> Word {
        return Word(meanings: try .from(dto: entry.meanings))
    }

    public func toDTO() throws -> Word.DTO {
        return Word.DTO(meanings: try self.meanings.toDTO())
    }
}


