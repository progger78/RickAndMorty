//
//  RMEpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by 1 on 30.08.2023.
//

import UIKit

// MARK: VC for displaying episode detais
class RMEpisodeDetailVC: UIViewController {
    
    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    private let episodeDetailView = RMEpisodeDetailView()

   
    
    // MARK: - INIT
    
    init(url: URL?) {
        self.viewModel = .init(endpointURL: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError()
    }
    
    // MARK: - Lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.addSubviews(episodeDetailView)
        view.topPin(customView: episodeDetailView, view: view)
        viewModel.fetchEpisodeData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        
    }
    
    @objc
    func didTapShare() {
        //        TODO: Add sharing user function
        
    }

}
