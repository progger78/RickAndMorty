//
//  RMEpisodesVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMEpisodesVC: UIViewController, RMEpisodeListViewDelegate{

    
    private let episodesListView = RMEpisodeListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episodes"
        setUpView()
       
        
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(episodesListView)
        episodesListView.delegate = self
        view.topPin(customView: episodesListView, view: view)
        addSearchButton()
        
    }
    
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    @objc private func didTapSearch(){
        let vc = RMSearchVC(config: RMSearchVC.Config(type: .episodes))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    // MARK: - RMEpisodeViewDelegate
    
    
    func rmEpisodeListView(_ episodeListView: RMEpisodeListView, didSelectEpisode episode: RMEpisode) {
       
        let detailVC = RMEpisodeDetailVC(url: URL(string: episode.url) )
        detailVC.navigationItem.largeTitleDisplayMode = .never
        detailVC.title = episode.name
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
