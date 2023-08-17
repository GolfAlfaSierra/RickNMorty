//
//  ViewController.swift
//  RickNMorty
//
//  Created by artyom s on 17.08.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 100)
        
        let collectionView = CharactersCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID)
        
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
    }
    
    

}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID, for: indexPath)

            headerView.frame.size.height = 100
        
        return headerView
    }
    
    // MARK: - dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}

final class CharactersCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = UIColor(named: "background_color")
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class HeaderView: UICollectionReusableView {
    static let reuseID = String(describing: HeaderView.self)
    
    private let label: UILabel = {
        let label = UILabel()
        
        label.text = "LLLLLOOOOL"
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Semibold", size: 44)
        
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(label)
        label.frame = frame
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
