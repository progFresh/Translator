//
//  ColorExt.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

public extension UIColor {

    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}

public extension UIColor {

    enum Translate {
        public static var lightBlue: UIColor {
            return UIColor(126,179,255)
        }
        public static var red: UIColor {
            return UIColor(220,20,60)
        }
    }
}
