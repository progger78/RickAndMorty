//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by 1 on 31.08.2023.
//

import UIKit

class RMEpisodeDetailView: UIView {
 
    private var viewModel: RMEpisodeDetailViewViewModel? {
        didSet {
            self.spinner.stopAnimating()
            self.collectionView?.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView?.alpha = 1
            }
        }
    }
    
    private var collectionView: UICollectionView?
  
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        spinner.startAnimating()
        let collectionView = createCollectionView()
        addSubviews(collectionView,spinner)
        self.collectionView = collectionView
        addConstraints()
    }
    
    private func addConstraints() {
        guard let collectionView = collectionView else {
            return
        }

        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 50),
            spinner.widthAnchor.constraint(equalToConstant: 50),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return self.layout(for: section)
            
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
        
    }
    
    
    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
    
    
}

extension RMEpisodeDetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemTeal
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}


extension RMEpisodeDetailView {
    func layout(for section: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(100)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

