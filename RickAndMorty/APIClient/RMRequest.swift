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
    
    convenience init? (url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0] // Endpoint
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                    
                }
                
                if let rmEndPoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endPoint: rmEndPoint, pathComponents: pathComponents)
                    return
                }
            }
        }
        
        if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemString = components[1]
                let queryItems: [URLQueryItem] = queryItemString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                })
                if let rmEndPoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endPoint: rmEndPoint, queryParameters: queryItems)
                    return
                }
            }
        }
        return nil
    }

}


    
extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
    static let listEpisodeRequest = RMRequest(endPoint: .episode)
}
