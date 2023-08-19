//
//  CharacterCardCell.swift
//  RickNMorty
//
//  Created by artyom s on 19.08.2023.
//

import UIKit

private enum Constants {
    static let cellLabelFont = AppFonts.gilroySemiBold?.withSize(22)
}

final class CharacterCardCell: UICollectionViewCell {
    static let reuseID = String(describing: CharacterCardCell.self)

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.textColor = .white
        label.font = Constants.cellLabelFont
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    private func configureUI() {
        backgroundColor = AppColors.cellBackgoundColor
        layer.cornerRadius = 16

        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),

            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: textLabel.bottomAnchor, multiplier: 2),

            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
