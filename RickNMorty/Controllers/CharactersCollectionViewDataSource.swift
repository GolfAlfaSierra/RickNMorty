//
//  CharactersCollectionViewDataSource.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharactersCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var characters: RickNMorty?
    let networkManager = NetworkManager()

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        characters?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCardCell.reuseID, for: indexPath) as! CharacterCardCell

        let name = characters?.results[indexPath.row].name

        cell.textLabel.text = name

        if let imageURL = characters?.results[indexPath.row].image, let url = URL(string: imageURL) {
            networkManager.loadImage(with: url) { image in
                cell.imageView.image = image
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind _: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharactersHeaderView.reuseID, for: indexPath)
    }
}
