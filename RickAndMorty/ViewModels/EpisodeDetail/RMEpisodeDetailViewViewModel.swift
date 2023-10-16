//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 31.08.2023.
//

import UIKit


protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
    
}

final class RMEpisodeDetailViewViewModel {
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    private let endpointUrl: URL?
    
    enum SectionTypes {
        case information(viewModel: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }
    
    public private(set) var cellViewModels: [SectionTypes] = []
    
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            setCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    public func character(for indexPath: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else {
            return nil
        }
        return dataTuple.characters[indexPath]
    }
    
    
    init(endpointURL: URL?) {
        self.endpointUrl = endpointURL
    }
    
    private func setCellViewModels() {
        guard let dataTuple = dataTuple else {
            return
        }
        
        let episode = dataTuple.episode
        let characters = dataTuple.characters
        
        var createdString = ""
        if let createdDate = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: episode.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: createdDate) 
        }
        
        cellViewModels = [
            
            .information(viewModel: [
                .init(title: "Name", value: episode.name),
                .init(title: "Aired On", value: episode.air_date),
                .init(title: "Episode", value: episode.episode),
                .init(title: "Created at", value: createdString),
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
            }))
            
        ]
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
                    print("done")
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                    print("\(characters.count)")
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
        
        group.notify(queue: .main){
            self.dataTuple = (episode: episode, characters: characters)
        }
    }
    
    public func createInfoLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    
    public func createCharacterLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 2, trailing: 10)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
