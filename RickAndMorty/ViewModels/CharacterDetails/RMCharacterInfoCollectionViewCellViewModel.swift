//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import Foundation
import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
   
    public let type: Type
    public var value: String 
    
    
    public var title: String {
        return type.displayTitle
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    public var iconImage: UIImage? {
            return type.iconImage
     
    }
    
    public var displayValue: String {
        if value.isEmpty {
            return "None"
        }
       
        if let date = Self.dateFormatter.date(from: value), type == .created {
         
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    
    
    enum `Type`: String {
        case status
        case gender
        case species
        case type
        case location
        case origin
        case created
        case episodesCount
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodesCount:
                return UIImage(systemName: "bell")
            }
        }
        
        var displayTitle: String {
            switch self {
            case .status,
            .gender,
            .species,
            .type,
            .location,
            .origin,
            .created:
                return rawValue.uppercased()
            case .episodesCount:
                return "EPISODES COUNT"

            }
        }
        
       
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemMint
            case .gender:
                return .systemMint
            case .species:
                return .systemCyan
            case .type:
                return .systemCyan
            case .location:
                return .systemMint
            case .origin:
                return .systemMint
            case .created:
                return .systemCyan
            case .episodesCount:
                return .systemCyan
            }
        }
        
        
    }

    init(value: String, type: Type){
        self.value = value
        self.type = type
    
    }
}

