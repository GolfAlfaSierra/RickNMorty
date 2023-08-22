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

        networkManager.requestData { [weak self] data in
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
        let vc = CharacterDetailViewController()

        present(vc, animated: true)
    }
}
