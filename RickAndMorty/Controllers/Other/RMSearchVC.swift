//
//  RMSearchVC.swift
//  RickAndMorty
//
//  Created by 1 on 01.09.2023.
//

import UIKit
// Dynamic results search view
// Render search results
// Render no results
// Searching/Api call
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
            
            var name: String {
                switch self {
                case .character:
                    return "Search characters"
                case .location:
                    return "Search locations"
                case .episodes:
                    return "Search episodes"
                }
            }
        }
        
        let type: `Type`
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.name
        view.backgroundColor = .systemBackground


    }
    

    

}
