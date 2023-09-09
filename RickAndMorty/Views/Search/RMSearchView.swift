//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import UIKit



final class RMSearchView: UIView {

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - FUNCTIONALITY
    
    // Search input view(bar, selection, buttons)
    // No results view
    // Show Search results view
    
    
    
    private let viewModel: RMSearchViewViewModel
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemTeal
        translatesAutoresizingMaskIntoConstraints = false
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
