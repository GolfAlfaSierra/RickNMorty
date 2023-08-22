//
//  CharacterDetailViewControllerDataSource.swift
//  RickNMorty
//
//  Created by Artyom S on 21.08.2023.
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
    private let infoParameterTitles = ["Species", "Type", "Gender"]
    private var infoParameterValues = [String]()

    var characterModel = CharacterDetailModel() {
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
        switch section {
        case 0: return infoParameterTitles.count
        case 1: return 1
        case 2: return characterModel.characterEpisodes.count
        default: return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sectionHeaderTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionTypes(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch sectionType {
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseID, for: indexPath) as! InfoTableViewCell
            cell.parameterLabel.text = "\(infoParameterTitles[indexPath.row]):"
            cell.valueLabel.text = infoParameterValues[indexPath.row]
            return cell

        case .origin:
            let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.reuseID, for: indexPath) as! OriginTableViewCell
            cell.nameLabel.text = characterModel.characterOrigin.name
            cell.typeLabel.text = characterModel.characterOrigin.type
            return cell

        case .episodes:
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.reuseID, for: indexPath) as! EpisodesTableViewCell
            let episode = characterModel.characterEpisodes[indexPath.row]
            cell.episodeNameLabel.text = episode.name
            
            let numbers = extractNumbers(from: episode.episode)
            let se = Int(numbers[0])!
            let ep = Int(numbers[1])!
            
            cell.episodeNumberLabel.text = "Episode: \(ep), Season: \(se)"
            cell.releaseDateLabel.text = episode.airDate
            return cell
        }
    }
}

extension CharacterDetailViewControllerDataSource {
    enum SectionTypes: Int {
        case info, origin, episodes
    }
}

private func extractNumbers(from input: String) -> [String] {
    do {
        let pattern = "[0-9]+"
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: input, options: [], range: NSRange(input.startIndex..., in: input))
        
        return matches.map {
            let range = Range($0.range, in: input)!
            return String(input[range])
        }
    } catch {
        print("Error creating regex: \(error)")
        return []
    }
}
