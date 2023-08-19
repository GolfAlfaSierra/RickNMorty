//
//  CharactersCollectionViewFlowLayout.swift
//  RickNMorty
//
//  Created by artyom s on 20.08.2023.
//

import UIKit

private enum Constants {
    static let headerHeight = 100.0
}

final class CharactersCollectionViewFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {
    override init() {
        super.init()

        headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: Constants.headerHeight)
        itemSize = .init(width: 156, height: 202)
        minimumLineSpacing = 16
        minimumInteritemSpacing = 16
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
