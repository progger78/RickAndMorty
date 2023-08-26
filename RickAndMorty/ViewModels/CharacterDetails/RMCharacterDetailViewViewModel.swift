//
//  RMCharactedDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 21.08.2023.
//

import Foundation
import UIKit


final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    
    enum SectionType{
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information(viewModel: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes(viewModel: [RMCharactereEpisodesCollectionViewCellViewModel])
        
    }
    
    public var sections: [SectionType] = []
    
    init(character: RMCharacter){
        self.character = character
        setUpSections()
        
    }
    
    private func setUpSections(){
        sections = [
            .photo(viewModel: .init()),
            .information(viewModel: [
                .init(),
                .init(),
                .init()
            ]),
            .episodes(viewModel: [
                .init(),
                .init(),
                .init()])
        ]
    }
    
    public var title: String {
        return character.name.uppercased()
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createInfoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 2, trailing: 0)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150)), subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createEpisodesSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(150)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}
