//
//  RMCharactereEpisodesCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import Foundation



protocol RMRenderEpisodeData {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharactereEpisodesCollectionViewCellViewModel{
    
    let episodeUrl: URL?
    private var isFetching = false
    private var dataBlock: ((RMRenderEpisodeData) -> Void)?
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            dataBlock?(model)
            
        }
    }
    
    init(episodeUrl: URL?){
        self.episodeUrl = episodeUrl
    }
    
  
    public func registerForData(_ block: @escaping(RMRenderEpisodeData) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        
            
        guard let episodeUrl = episodeUrl, let rmRequest = RMRequest(url: episodeUrl) else {
            return
        }
        
        isFetching = true
        
        RMService.shared.execute(rmRequest, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model 
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }

    }
   
        
       
   

    
}
