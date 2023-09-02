//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 31.08.2023.
//

import Foundation


protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    private let endpointUrl: URL?
    
    enum SectionTypes {
        case information(viewModel: [RMEpisodeInfoColectionViewCellViewModel])
        case characters(viewModel: [RMCharactereEpisodesCollectionViewCellViewModel])
    }
    
    public private(set) var sections: [SectionTypes] = []
    
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    init(endpointURL: URL?) {
        self.endpointUrl = endpointURL
    }
  
    public func fetchEpisodeData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure(_):
                break
            }
            
        }
    }
    
    public func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) {
                result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
        
        group.notify(queue: .main){
            self.dataTuple = (episode, characters)
        }
    }
    
}
