//
//  TranslateService.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import NodeKit

final class TranslateService {

    // MARK: - Nested Types

    private enum Keys {
        static let contractNumber = "contractNumber"
        static let email = "email"
    }

    private enum Endpoint: UrlRouteProvider {
        case translate(String, String)

        func url() throws -> URL {
            let base = URL(string: "https://dictionary.skyeng.ru/api/public/v1")
            switch self {
            case .translate(let word, let page):
                let byWord = try base + "/words/search"
                var urlComponents = URLComponents(url: byWord, resolvingAgainstBaseURL: true)
                urlComponents?.queryItems = [
                    URLQueryItem(name: "search", value: "\(word)"),
                    URLQueryItem(name: "pageSize", value: "\(page)")
                ]
                return urlComponents?.url ?? byWord
            }
        }
    }

    // MARK: - Private Properties

    private var chainBuilder: UrlChainsBuilder<Endpoint> {
        return .init()
    }

    // MARK: - Public Methods

    func getTranslation(word: String, page: String) -> Observer<[Word]> {
        self.chainBuilder
            .route(.get, .translate(word, page))
            .build()
            .process()
    }
}

