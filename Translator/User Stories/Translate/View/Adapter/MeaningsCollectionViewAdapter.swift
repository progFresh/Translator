//
//  MeaningsCollectionViewAdapter.swift
//  Translator
//
//  Created by Сергей Полозов on 15.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import UIKit

final class MeaningsCollectionViewAdapter :
NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - Constants

    private enum Constants {
        static let cellSideMargin: CGFloat = 8
        static let cellLabelFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        static let cellHeight: CGFloat = 35
    }

    // MARK: - Public Properties

    var onMeaningTouch: ((Meaning) -> Void)?

    // MARK: - Private Properties

    private var meanings: [Meaning]
    private let cellName = String(describing: MeaningCell.self)

    // MARK: - Init

    init(collectionView: UICollectionView, meanings: [Meaning]) {
        collectionView.register(
            UINib(nibName: cellName, bundle: nil),
            forCellWithReuseIdentifier: cellName
        )
        self.meanings = meanings
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meanings.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellName,
            for: indexPath
            ) as? MeaningCell else { return UICollectionViewCell() }

        cell.configure(with: meanings[indexPath.row])
        cell.onCellTouch = { [weak self] meaning in
            self?.onMeaningTouch?(meaning)
        }
        return cell
    }

    // MARK: - Flow Layout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.font = Constants.cellLabelFont
        label.text = meanings[indexPath.row].translation.text
        label.sizeToFit()
        let labelWidth = label.frame.width
        let width = labelWidth + Constants.cellSideMargin * 2
        if width >= collectionView.bounds.width {
            let errorWidth = collectionView.bounds.width
            return CGSize(width: errorWidth, height: Constants.cellHeight)
        }
        return CGSize(width: width, height: Constants.cellHeight)
    }
}
