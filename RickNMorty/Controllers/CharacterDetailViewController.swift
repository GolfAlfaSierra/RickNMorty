//
//  CharacterDetailViewController.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    let tableView = CharacterDetailTableView()
    let dataSource = CharacterDetailViewControllerDataSource()
    private let networkManager = NetworkManager()
    private let characterDetailHeaderView = CharacterDetailHeaderView()

    let avatarImage: UIImage
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let locationURL: String
    var episodeURLs: [String]

    init(
        avatarImage: UIImage,
        name: String,
        status: Status,
        species: String,
        type: String,
        gender: Gender,
        locationURL: String,
        episodeURLs: [String]
        
    ) {
        self.avatarImage = avatarImage
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.locationURL = locationURL
        self.episodeURLs = episodeURLs
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        characterDetailHeaderView.updateState(image: avatarImage, name: name, status: status.rawValue)
        dataSource.characterModel.characterInfo.species = species
        dataSource.characterModel.characterInfo.type = type
        dataSource.characterModel.characterInfo.gender = gender.rawValue
        
        networkManager.fetchLocationData(urlString: locationURL){ [weak self] response in
            self?.dataSource.characterModel.characterOrigin.name = response.name
            self?.dataSource.characterModel.characterOrigin.type = response.type
            self?.tableView.reloadData()
        }
        
        for episodeURL in episodeURLs {
            networkManager.fetchEpisodeData(urlString: episodeURL) {[weak self] response in
                
                let data = CharacterDetailEpisodeModel(name: response.name, airDate: response.airDate, episode: response.episode)
                
                self?.dataSource.characterModel.characterEpisodes.append(data)
                self?.tableView.reloadData()
            }
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 1 / 3, animations: {
            self.tableView.tableHeaderView = self.tableView.tableHeaderView
            self.tableView.alpha = 1
            self.tableView.layoutIfNeeded()
        })
    }
}

private extension CharacterDetailViewController {
    func setupTableView() {
        registerCells()

        tableView.dataSource = dataSource
        tableView.delegate = self

        tableView.tableHeaderView = characterDetailHeaderView

        view = tableView
    }

    func registerCells() {
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.reuseID)
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: OriginTableViewCell.reuseID)
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: EpisodesTableViewCell.reuseID)
    }
}

extension CharacterDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = AppFonts.gilroySemiBold?.withSize(17)
        label.textColor = .white

        label.text = dataSource.tableView(tableView, titleForHeaderInSection: section)

        return label
    }
}
