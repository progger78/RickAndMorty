//
//  File.swift
//  RickAndMorty
//
//  Created by 1 on 31.08.2023.
//

import Foundation


final class RMAPICacheManager {
    
    init(){
        setUpCache()
    }
    
    private var cacheDictionary: [RMEndpoint: NSCache<NSString,NSData>] = [:]
    
    public func cachedData(for endPoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endPoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endPoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endPoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        return targetCache.setObject(data as NSData, forKey: key)
    }
    
    private func setUpCache() {
        RMEndpoint.allCases.forEach { endPoint in
            cacheDictionary[endPoint] = NSCache<NSString, NSData>()
        }
    }
}
