//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {

    let imageUrl: URL?
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(with: imageUrl, completion: completion)
    }
}
