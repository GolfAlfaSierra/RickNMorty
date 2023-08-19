//
//  CharactersCollectionView.swift
//  RickNMorty
//
//  Created by artyom s on 19.08.2023.
//

import UIKit

final class CharactersCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        backgroundColor = AppColors.backgoundColor

        contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
