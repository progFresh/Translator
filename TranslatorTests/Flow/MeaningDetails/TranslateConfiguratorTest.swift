//
//  TranslateConfiguratorTest.swift
//  TranslatorTests
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import XCTest
@testable import Translator

class TranslateModuleConfiguratorTest: XCTestCase {

    // MARK: - Tests

    func testDeallocation() {
        assertDeallocation(of: {
            let view = TranslateModuleConfigurator().configure()
            return (view, [])
        })
    }

}
