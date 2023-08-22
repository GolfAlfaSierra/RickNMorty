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

    let imageView: CharacterCardImageView = {
        let imageView = CharacterCardImageView(frame: .zero)
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "TEST"
        label.textColor = .white
        label.font = Constants.cellLabelFont
        label.adjustsFontSizeToFitWidth = true
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
        contentView.addSubview(nameLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),

            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 2),

            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9 )
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if imageView.image == nil {
            imageView.activityIndicator.startAnimating()
            return
        }

        imageView.activityIndicator.stopAnimating()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
