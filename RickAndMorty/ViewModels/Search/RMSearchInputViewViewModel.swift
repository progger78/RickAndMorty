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
    
    enum DynamicOptions: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
    }
    public var hasDynamicOption: Bool {
        switch self.type {
        case .location, .character:
            return true
        case .episodes:
            return false
        }
    }
    
    public var options: [DynamicOptions] {
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
