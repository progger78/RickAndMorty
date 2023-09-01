//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 31.08.2023.
//

import Foundation


final class RMEpisodeDetailViewViewModel {
    
    
    private let endpointUrl: URL?
    
    init(endpointURL: URL?) {
        self.endpointUrl = endpointURL
    }
    
    public func fetchEpisodeData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(_):
                break
            }
   
        }
    }
}
