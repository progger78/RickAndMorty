//
//  RMEpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by 1 on 30.08.2023.
//

import UIKit
// MARK: VC for displaying episode detais
class RMEpisodeDetailVC: UIViewController {
    
    let url: URL?
    
    // MARK: - INIT
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError()
    }
    
    // MARK: - Lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Episode"
        
    }
    

}
