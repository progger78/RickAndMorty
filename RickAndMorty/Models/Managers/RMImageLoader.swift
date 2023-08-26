//
//  RMImageLoader.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import Foundation
import UIKit


final class RMImageLoader {
    
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init(){}
    func downloadImage(with url: URL, completion: @escaping(Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
            print("chaching from \(key)")
            completion(.success(data as Data))
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))

        }
        
       
        task.resume()

    }
    
    
    
}
