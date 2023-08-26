//
//  RMCharactedDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 21.08.2023.
//

import Foundation


final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title: String {
        return character.name.uppercased()
    }
}
