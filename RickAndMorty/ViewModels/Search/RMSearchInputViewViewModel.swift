//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import Foundation


final class RMSearchInputViewViewModel {
    
    private let type: RMSearchVC.Config.`Type`
    
    // MARK: - Init
    init(type: RMSearchVC.Config.`Type`){
        self.type = type
    }
    
    enum DynamicOption: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var choices: [String] {
            switch self {
            case .status:
                return ["alive", "dead", "unknown"]
            case .gender:
                return ["male", "female", "genderless", "unknown"]
            case .locationType:
                return ["cluster", "planet", "microverse"]
            }
        }
        
    }
    public var hasDynamicOption: Bool {
        switch self.type {
        case .location, .character:
            return true
        case .episodes:
            return false
        }
    }
    
    public var options: [DynamicOption] {
        switch self.type {
        case .character:
            return [.status, .gender]
        case .location:
            return [.locationType]
        case .episodes:
            return []
        }
    }
    
    public var placeHolderText: String {
        switch self.type {
        case .character:
            return "Character name"
        case .location:
            return "Location name"
        case .episodes:
            return "Episode title"
        }
    }
    
}
