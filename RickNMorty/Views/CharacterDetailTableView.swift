//
//  CharacterDetailTableView.swift
//  RickNMorty
//
//  Created by artyom s on 21.08.2023.
//

import UIKit

final class CharacterDetailTableView: UITableView {
    private static let vertiacalPaddingValue = 8 * 6.0

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        backgroundColor = AppColors.backgoundColor
        alpha = 0
        separatorStyle = .none
        sectionHeaderHeight = Self.vertiacalPaddingValue
        allowsSelection = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
