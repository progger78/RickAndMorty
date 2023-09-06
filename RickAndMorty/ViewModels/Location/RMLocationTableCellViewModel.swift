//
//  LocationCellViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 06.09.2023.
//

import Foundation



struct RMLocationTableCellViewModel: Hashable, Equatable {
   
    let location: RMLocation
    
    init(location: RMLocation){
        self.location = location
    }
    
    public var name: String {
        return location.name
    }
    
    public var type: String {
        return location.type
    }
    
    public var dimension: String {
        return location.dimension
    }
    
    
    static func == (lhs: RMLocationTableCellViewModel, rhs: RMLocationTableCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(location.id)
        hasher.combine(dimension)
    }
    
}
