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
    
    private let viewModel: RMSearchViewViewModel
    
    private let searchView: RMSearchView
    
    init(config: Config) {
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
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
        title = viewModel.config.type.name
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        view.topPin(customView: searchView, view: view)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))
        
    }
    
    @objc
    private func didTapExecuteSearch() {
//        viewModel.executeSearch
    }
    
    

    

}
