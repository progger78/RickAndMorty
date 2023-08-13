//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by 1 on 12.08.2023.
//

import Foundation


final class RMRequest{
    
    let endPoint: RMEndpoint
    
    let pathComponents: Set<String>
    
    let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
            
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    public let httpMethod = "GET"
    
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    // MARK: - public
    
    public init(endPoint: RMEndpoint,
         pathComponents: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
