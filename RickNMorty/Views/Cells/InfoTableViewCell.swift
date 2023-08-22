//
//  InfoTableViewCell.swift
//  RickNMorty
//
//  Created by artyom s on 22.08.2023.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    static let reuseID = String(describing: InfoTableViewCell.self)
    let parameterLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.appGray
        label.font = AppFonts.gilroyMedium?.withSize(16)

        label.text = "Type"

        return label
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.gilroyMedium?.withSize(16)

        label.text = "None"

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
        contentView.addSubview(parameterLabel)
        contentView.addSubview(valueLabel)

        parameterLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            parameterLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            parameterLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),

            valueLabel.centerYAnchor.constraint(equalTo: parameterLabel.centerYAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: valueLabel.trailingAnchor, multiplier: 2)
        ])
    }
}
