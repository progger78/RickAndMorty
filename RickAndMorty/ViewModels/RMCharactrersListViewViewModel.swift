//
//  CharactrersListViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 15.08.2023.
//

import Foundation
import UIKit


final class RMCharactersListViewViewModel: NSObject {
     func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharacterResponce.self) { result in
            switch result{
            case .success(let model):
                print("Amount of pages" + String(model.info.pages))
                print("example url: \(model.results.first?.image ?? "No image found")")
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}



extension RMCharactersListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.collectionCellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("unsupported cell")
        }
        let viewModel = RMCharactersCollectionViewCellViewModel(characterName: "Egor", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        )
        cell.configure(for: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width , height: width * 1.4)
    }
    
    
    
}
