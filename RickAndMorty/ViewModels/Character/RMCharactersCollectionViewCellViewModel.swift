//
//  RMCharactersCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 16.08.2023.
//

import Foundation


/// Single cell for a character

final class RMCharactersCollectionViewCellViewModel: Hashable, Equatable{
    static func == (lhs: RMCharactersCollectionViewCellViewModel, rhs: RMCharactersCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL? ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        guard let characterImageUrl = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(with: characterImageUrl, completion: completion)
    }
    
    
}
