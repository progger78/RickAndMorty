//
//  RMService.swift
//  RickAndMorty
//
//  Created by 1 on 12.08.2023.
//

import Foundation

///
final class RMService {
    
    static let shared = RMService()
    
   
    
    private init(){}
    
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
