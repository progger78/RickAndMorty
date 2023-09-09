//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import UIKit

final class RMSearchInputView: UIView {

    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    public var viewModel: RMSearchInputViewViewModel? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOption else {
                return
            }
            let option = viewModel.options
            createOptionSelectionViews(options: option)

        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOptions]){
        for option in options {
            print(option.rawValue)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPink
        addSubviews(searchBar)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.placeHolderText
        // TODO: Fix height of input view in episode options
        self.viewModel = viewModel
    }
}
 
