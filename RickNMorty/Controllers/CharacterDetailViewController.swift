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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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

        tableView.tableHeaderView = CharacterDetailHeaderView()

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
