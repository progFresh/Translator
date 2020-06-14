//
//  CollectionView.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class CollectionView: UICollectionView {

    // func fixes bag with not moving screen when user touchs button in a UICollectionView scroll
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton || view is UITextField {
            return  true
        }
        return super.touchesShouldCancel(in: view)
    }
}
