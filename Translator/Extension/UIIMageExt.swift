//
//  UIIMageExt.swift
//  Translator
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//
import UIKit
import AlamofireImage

extension UIImageView {

    func setImage(with urlString: String?, placeholderImage: UIImage? = nil) {
        if let urlString = urlString, let url = URL(string: urlString) {
            self.af_setImage(
                withURL: url,
                placeholderImage: placeholderImage,
                filter: nil,
                imageTransition: .crossDissolve(0.2)
            )
        } else {
            self.image = placeholderImage
        }
    }
}

