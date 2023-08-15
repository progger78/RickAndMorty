//
//  CharactrersListViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 15.08.2023.
//

import Foundation
import UIKit


final class CharactersListViewViewModel: NSObject{
     func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharacterResponce.self) { result in
            switch result{
            case .success(let model):
                print("Amount of pages" + String(model.info.pages))
                print("Amount of pages" + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


extension CharactersListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemMint
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
}
