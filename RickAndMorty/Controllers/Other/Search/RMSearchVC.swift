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
            
            var endPoint: RMEndpoint {
                switch self {
                case .character: return .character
                case .location: return .location
                case .episodes: return .episode
                }
            }
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.presentKeyboard()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.name
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        view.topPin(customView: searchView, view: view)
        searchView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))
        
    }
    
    @objc
    private func didTapExecuteSearch() {
        viewModel.executeSearch()
    }

}

extension RMSearchVC: RMSearchViewDelegate {
    func rmSearchView(_ view: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption) {
        let vc = RMSearchOptionPickerVC(option: option) { [weak self ] selection in
            DispatchQueue.main.async {
                self?.viewModel.set(value: selection, for: option)
            }
        }
        vc.sheetPresentationController?.detents = [.medium()]
        vc.sheetPresentationController?.prefersGrabberVisible = true
        vc.sheetPresentationController?.preferredCornerRadius = 10
        present(vc, animated: true)
    }
    
    
}
