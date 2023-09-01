//
//  RMSearchVC.swift
//  RickAndMorty
//
//  Created by 1 on 01.09.2023.
//

import UIKit

class RMSearchVC: UIViewController {

    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    public var config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    struct Config {
        enum `Type` {
            case character
            case episodes
            case location
        }
        
        let type: `Type`
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground


    }
    

    

}
