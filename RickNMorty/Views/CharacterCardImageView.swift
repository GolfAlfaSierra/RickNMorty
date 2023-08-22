//
//  CharacterCardImageView.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharacterCardImageView: UIImageView {
    let activityIndicator = UIActivityIndicatorView()

    override var image: UIImage? {
        didSet {
            if image == nil {
                activityIndicator.startAnimating()
                return
            }
            activityIndicator.stopAnimating()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true

        activityIndicator.style = .large
        activityIndicator.color = .white

        addSubview(activityIndicator)
        activityIndicator.startAnimating()

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
