//
//  RMLocationDetailVC.swift
//  RickAndMorty
//
//  Created by 1 on 08.09.2023.
//

import UIKit

class RMLocationDetailVC: UIViewController, RMLocationDetailViewViewModelDelegate, RMLocationDetailViewDelegate {
    
    
    
    private let viewModel: RMLocationDetailViewViewModel
    
    private let detailView = RMLocationDetailView()

   
    
    // MARK: - INIT
    
    init(location: RMLocation) {
        let url = URL(string: location.url)
        self.viewModel = RMLocationDetailViewViewModel(endpointURL: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError()
    }
    
    // MARK: - Lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.addSubviews(detailView)
        view.topPin(customView: detailView, view: view)
        detailView.delegate = self
        viewModel.delegate = self
        viewModel.fetchLocationData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        
    }
    
    @objc
    func didTapShare() {
        //        TODO: Add sharing user function
        
    }
    
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
    
    func rmLocationDetailView(_ detailView: RMLocationDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailVC(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

