//
//  CharacterDetailHeaderView.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharacterDetailHeaderView: UIView {
    var isConstraintSet = false

    let imageView: CharacterCardImageView = {
        let imageView = CharacterCardImageView(frame: .zero)
        imageView.layer.cornerRadius = 16

        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.gilroyBold?.withSize(22)

        return label
    }()
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.appGreenColor
        label.font = AppFonts.gilroyMedium?.withSize(16)

        return label
    }()

    private let imageFrameSize = 148.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraints()
    }

    private func configureConstraints() {
        if !isConstraintSet {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 1),

                imageView.widthAnchor.constraint(equalToConstant: imageFrameSize),
                imageView.heightAnchor.constraint(equalToConstant: imageFrameSize),

                imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),

                imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                statusLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),

                nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
                statusLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 3),
                bottomAnchor.constraint(equalToSystemSpacingBelow: statusLabel.bottomAnchor, multiplier: 2)
            ])
            isConstraintSet = false
        }
    }

    private func configureUI() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)

        nameLabel.text = "name"
        statusLabel.text = "status"

        imageView.backgroundColor = AppColors.cellBackgoundColor

        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
