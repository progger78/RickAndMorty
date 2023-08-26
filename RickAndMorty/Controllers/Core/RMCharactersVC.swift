//
//  RMCharactersVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMCharactersVC: UIViewController, RMCharactersListViewDelegate {
    
    
    
    private let charactersListView = RMCharactersListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersListView.delegate = self
        title = "Characters"
        view.backgroundColor = .systemBackground
        view.addSubview(charactersListView)
        view.topPin(customView: charactersListView, view: view)
        
    }
    
    // MARK: - RMCharacterListViewDelegate
    
    
    func rmCharacterListView(_ characterListView: RMCharactersListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailVC(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }

}





