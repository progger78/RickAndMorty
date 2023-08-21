//
//  CharactrersListViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 15.08.2023.
//

import Foundation
import UIKit


protocol RMCharactersListViewViewModelDelegate: AnyObject {
    func didLoadIntitalCharacters()
}

final class RMCharactersListViewViewModel: NSObject {
    
    public weak var delegate: RMCharactersListViewViewModelDelegate?
    
    private var cellViewModels: [RMCharactersCollectionViewCellViewModel] = []
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharactersCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
     func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharacterResponce.self) { [weak self] result in
            switch result{
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadIntitalCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}



extension RMCharactersListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.collectionCellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("unsupported cell")
        }
        
        cell.configure(for: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width , height: width * 1.4)
    }
 
    
    
}
