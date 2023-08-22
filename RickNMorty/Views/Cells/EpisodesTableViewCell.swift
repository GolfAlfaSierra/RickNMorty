//
//  EpisodesTableViewCell.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class EpisodesTableViewCell: UITableViewCell {
    static let reuseID = String(describing: EpisodesTableViewCell.self)

    private let containerView = UIView()

    let episodeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.gilroySemiBold?.withSize(17)
        label.text = "Pilot"
        return label
    }()
    let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.appGreenColor
        label.font = AppFonts.gilroySemiBold?.withSize(13)
        label.text = "Episode: 1, Season: 1"
        return label
    }()

    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.appDarkGrayColor
        label.font = AppFonts.gilroySemiBold?.withSize(13)
        label.text = "December 9, 2013"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        contentView.backgroundColor = AppColors.backgoundColor
        containerView.backgroundColor = AppColors.cellBackgoundColor
        containerView.layer.cornerRadius = 16

        contentView.addSubview(containerView)
        containerView.addSubview(episodeNameLabel)
        containerView.addSubview(episodeNumberLabel)
        containerView.addSubview(releaseDateLabel)

        episodeNameLabel.sizeToFit()
        episodeNumberLabel.sizeToFit()

        containerView.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

        let heightPading = -16 * 2.0

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: heightPading),
            containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            episodeNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: containerView.leadingAnchor, multiplier: 2),
            episodeNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: containerView.topAnchor, multiplier: 2),

            episodeNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: episodeNameLabel.bottomAnchor, multiplier: 2),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: episodeNameLabel.leadingAnchor),

            releaseDateLabel.centerYAnchor.constraint(equalTo: episodeNumberLabel.centerYAnchor),
            containerView.trailingAnchor.constraint(equalToSystemSpacingAfter: releaseDateLabel.trailingAnchor, multiplier: 2),

            containerView.bottomAnchor.constraint(equalToSystemSpacingBelow: episodeNumberLabel.bottomAnchor, multiplier: 2)
        ])
    }
}
