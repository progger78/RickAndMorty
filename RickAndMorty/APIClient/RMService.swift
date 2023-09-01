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
    
    private let cacheManager = RMAPICacheManager()
    
    private init(){}
    
    enum RMServiceError: Error {
        case faildeToCreateRequest
        case faildeToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.faildeToCreateRequest))
            return
        }
        
        if let cachedData = cacheManager.cachedData(for: request.endPoint, url: request.url) {
            print("reading from cache")
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.faildeToGetData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                
                self?.cacheManager.setCache(for: request.endPoint, url: request.url, data: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}


