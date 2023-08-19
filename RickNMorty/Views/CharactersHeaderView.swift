//
//  CharactersHeaderView.swift
//  RickNMorty
//
//  Created by artyom s on 20.08.2023.
//

import UIKit

private enum Constants {
    static let labelText = "Characters"
    static let labelFont = AppFonts.gilroyBold?.withSize(28)
}

final class CharactersHeaderView: UICollectionReusableView {
    static let reuseID = String(describing: CharactersHeaderView.self
    )

    private let label: UILabel = {
        let label = UILabel()

        label.text = Constants.labelText
        label.textColor = .white
        label.font = Constants.labelFont

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            label.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
