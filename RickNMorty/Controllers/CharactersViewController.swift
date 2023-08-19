//
//  CharactersViewController.swift
//  RickNMorty
//
//  Created by artyom s on 17.08.2023.
//

import UIKit

private enum Constants {
    static let headerHeight = 100.0
    static let cellLabelFont = AppFonts.gilroySemiBold?.withSize(22)
}

final class CharactersViewController: UIViewController {
    private let dataSource = CharactersCollectionViewDataSource()
    private var collectionView: UICollectionView! = nil
    private var collectionViewLayout: UICollectionViewFlowLayout! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}

private extension CharactersViewController {
    func setupCollectionView() {
        let layout = CharactersCollectionViewFlowLayout()
        collectionViewLayout = layout

        let collectionView = CharactersCollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView

        collectionView.dataSource = dataSource
        collectionView.register(CharacterCardCell.self, forCellWithReuseIdentifier: CharacterCardCell.reuseID)
        collectionView.register(CharactersHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharactersHeaderView.reuseID)

        view = collectionView
    }
}

private final class CharactersCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCardCell.reuseID, for: indexPath) as! CharacterCardCell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind _: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharactersHeaderView.reuseID, for: indexPath)
        return headerView
    }
}
