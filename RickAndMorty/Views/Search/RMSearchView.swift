//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import UIKit



final class RMSearchView: UIView {

    // MARK: - FUNCTIONALITY
    
    private let searchInputView = RMSearchInputView()
    
    private let noSearchResultView = RMNoSearchResultsView()
    
    // Show Search results view
    
    
    
    private let viewModel: RMSearchViewViewModel
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(noSearchResultView, searchInputView)
        addConstraint()
        searchInputView.configure(with: .init(type: viewModel.config.type))
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            noSearchResultView.widthAnchor.constraint(equalToConstant: 150),
            noSearchResultView.heightAnchor.constraint(equalToConstant: 150),
            noSearchResultView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noSearchResultView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
            searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
    

}


extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
