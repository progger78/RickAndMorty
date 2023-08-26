//
//  RMGetAllCharactersResponce.swift
//  RickAndMorty
//
//  Created by 1 on 13.08.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
