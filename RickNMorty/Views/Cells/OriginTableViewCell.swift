//
//  OriginTableViewCell.swift
//  RickNMorty
//
//  Created by artyom s on 22.08.2023.
//

import UIKit

final class OriginTableViewCell: UITableViewCell {
    static let reuseID = String(describing: OriginTableViewCell.self)

    let typeImage: UIImageView = {
        let imageView = UIImageView()

        imageView.backgroundColor = AppColors.appOriginIconBackground
        imageView.layer.cornerRadius = 10

        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.gilroyMedium?.withSize(16)

        label.text = "Name: None"

        return label
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.gilroyMedium?.withSize(16)

        label.text = "Type: None"

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
        contentView.backgroundColor = AppColors.cellBackgoundColor

        contentView.addSubview(typeImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)

        typeImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            typeImage.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            typeImage.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: typeImage.bottomAnchor, multiplier: 1),

            typeImage.widthAnchor.constraint(equalToConstant: 64),
            typeImage.heightAnchor.constraint(equalTo: typeImage.widthAnchor, multiplier: 1),

            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: typeImage.trailingAnchor, multiplier: 1),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),

            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 2)
        ])
    }
}
