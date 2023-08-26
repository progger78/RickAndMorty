//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        
    }
    
    private func addConstraints() {
        
    }
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
}

}
