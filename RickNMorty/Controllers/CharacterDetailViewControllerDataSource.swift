//
//  CharacterDetailViewControllerDataSource.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharacterDetailViewControllerDataSource: NSObject, UITableViewDataSource {
    private let sectionHeaderTitles = ["Info", "Origin", "Episodes"]
    private let infoParamenterTitles = ["Species", "Type", "Gender"]

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionHeaderTitles[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return infoParamenterTitles.count}
        if section == 1 {return 1}

        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sectionHeaderTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        enum SectionTypes: Int {
            case info, origin, episodes
        }
        var cellToReturn = ""

        let type: SectionTypes = .init(rawValue: indexPath.section)!

        switch type {
        case .info:
            cellToReturn = InfoTableViewCell.reuseID
            let cell = tableView.dequeueReusableCell(withIdentifier: cellToReturn, for: indexPath) as! InfoTableViewCell
            cell.parameterLabel.text = "\(infoParamenterTitles[indexPath.row]): "
            return cell

        case .origin:
            cellToReturn = OriginTableViewCell.reuseID

        case .episodes:
            cellToReturn = EpisodesTableViewCell.reuseID
        }

        return tableView.dequeueReusableCell(withIdentifier: cellToReturn, for: indexPath)
    }
}
