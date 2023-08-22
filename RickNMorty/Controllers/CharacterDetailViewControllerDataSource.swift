//
//  CharacterDetailViewControllerDataSource.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

struct CharacterDetailInfoModel {
    var species: String = ""
    var type: String = ""
    var gender: String = ""
}
struct CharacterDetailOriginModel {
    var name: String = ""
    var type: String = ""
}
struct CharacterDetailEpisodeModel {
    var name: String
    var airDate: String
    var episode: String
}

struct CharacterDetailModel {
    var characterInfo = CharacterDetailInfoModel()
    var characterOrigin = CharacterDetailOriginModel()
    var characterEpisodes: [CharacterDetailEpisodeModel] = []
}

final class CharacterDetailViewControllerDataSource: NSObject, UITableViewDataSource {
    private let sectionHeaderTitles = ["Info", "Origin", "Episodes"]
    private let infoParamenterTitles = ["Species", "Type", "Gender"]
    private var infoParameterValues = [String]()
    var characterModel: CharacterDetailModel = CharacterDetailModel() {
        didSet {
            infoParameterValues = [
                characterModel.characterInfo.species,
                characterModel.characterInfo.type,
                characterModel.characterInfo.gender
            ]
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionHeaderTitles[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return infoParamenterTitles.count}
        if section == 1 {return 1}
        if section == 2 {return characterModel.characterEpisodes.count}

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
            cell.valueLabel.text = "\(infoParameterValues[indexPath.row])"
            return cell

        case .origin:
            cellToReturn = OriginTableViewCell.reuseID
            let cell = tableView.dequeueReusableCell(withIdentifier: cellToReturn, for: indexPath) as! OriginTableViewCell
            cell.nameLabel.text = characterModel.characterOrigin.name
            cell.typeLabel.text = characterModel.characterOrigin.type
            return cell
            
        case .episodes:
            cellToReturn = EpisodesTableViewCell.reuseID
            let cell = tableView.dequeueReusableCell(withIdentifier: cellToReturn, for: indexPath) as! EpisodesTableViewCell
            cell.episodeNameLabel.text = characterModel.characterEpisodes[indexPath.row].name
            cell.episodeNumberLabel.text = characterModel.characterEpisodes[indexPath.row].episode
            cell.releaseDateLabel.text = characterModel.characterEpisodes[indexPath.row].airDate
            return cell
        }
    }
}
