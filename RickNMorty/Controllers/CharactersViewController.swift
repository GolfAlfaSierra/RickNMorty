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
    private lazy var charactersCollectionView = CharactersCollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    private lazy var collectionViewLayout = CharactersCollectionViewFlowLayout()
    private let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        title = ""

        networkManager.fetchCharactersData { [weak self] data in
            self?.dataSource.characters = data
            self?.charactersCollectionView.reloadData()
        }
    }
}

private extension CharactersViewController {
    func setupCollectionView() {
        charactersCollectionView.dataSource = dataSource
        charactersCollectionView.delegate = self
        registerCells()
        view = charactersCollectionView
    }

    func registerCells() {
        charactersCollectionView.register(CharacterCardCell.self,
                                          forCellWithReuseIdentifier: CharacterCardCell.reuseID)
        charactersCollectionView.register(CharactersHeaderView.self,
                                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                          withReuseIdentifier: CharactersHeaderView.reuseID)
    }
}

extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCardCell
        guard let selectedCharacter = dataSource.characters?.results[indexPath.row] else {return}
        let name = selectedCharacter.name
        let status = selectedCharacter.status
        let species = selectedCharacter.species.rawValue
        let type = selectedCharacter.type
        let gender = selectedCharacter.gender
        
        let urlstring = selectedCharacter.location.url
        
        
        
        let vc = CharacterDetailViewController(avatarImage: cell.imageView.image!,
                                               name: name,
                                               status: status,
                                               species: species,
                                               type: type,
                                               gender: gender,
                                               locationURL: urlstring,
                                               episodeURLs: selectedCharacter.episode
        )
        
        
        
        navigationController!.pushViewController(vc, animated: true)
    }
}
