//
//  RMCharacterDetailVC.swift
//  RickAndMorty
//
//  Created by 1 on 21.08.2023.
//

import UIKit

final class RMCharacterDetailVC: UIViewController {
    
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    private let detailView: RMCharacterDetailView
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        self.detailView = RMCharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubviews(detailView)
        view.topPin(customView: detailView, view: view)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
        
    }
    
    @objc
    func didTapShare() {
        //        TODO: Add sharing user function
        
    }
}

extension RMCharacterDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType {
        case .photo:
            return 1
        case .information(let infoModel):
            return infoModel.count
        case .episodes(let episodeModel):
            return episodeModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .photo(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifier, for: indexPath) as?
                    RMCharacterPhotoCollectionViewCell else {
                fatalError("Unsupported cell")
            }
            cell.configure(with: viewModel)
            
            
            return cell
        case .information(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifier, for: indexPath) as?
                    RMCharacterInfoCollectionViewCell else {
                fatalError("Unsupported cell")
            }
            cell.configure(with: viewModels[indexPath.row])
            
            return cell
        case .episodes(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterEpisodesCollectionViewCell.cellIdentifier, for: indexPath) as?
                    RMCharacterEpisodesCollectionViewCell else {
                fatalError("Unsupported cell")
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }
        
    }
    
    
}
