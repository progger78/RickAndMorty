//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by 1 on 12.08.2023.
//

import Foundation


final class RMRequest{
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    let endPoint: RMEndpoint
    
    let pathComponents: [String]
    
    let queryParameters: [URLQueryItem]
    
    public let httpMethod = "GET"
    
    
    private var urlString: String {
        
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    init(endPoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
    public var url: URL? {
        return URL(string: urlString)
    }

}


    
extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
}
