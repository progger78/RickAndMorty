//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import UIKit
import SwiftUI

protocol RMSearchInputViewDelegate: AnyObject {
    func rmSearchInputView(_ view: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions)
}
final class RMSearchInputView: UIView {
    
    public weak var delegate: RMSearchInputViewDelegate?
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(searchBar)
        addConstraints()
    }
    
    private func setStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        return stackView
    }
    
    private func setOptionButton(option: RMSearchInputViewViewModel.DynamicOptions, tag: Int) -> UIButton {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: option.rawValue, attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .medium),
            .foregroundColor: UIColor.label,
            
            
        ]), for: .normal)
        button.tag = tag
        button.backgroundColor = .secondarySystemFill
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return button
    }
    
    private func createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOptions]){
        let stackView = setStackView()
        for x in 0..<options.count{
            let option = options[x]
            let button = setOptionButton(option: option, tag: x)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        guard let options = viewModel?.options else {
            return
        }
        let tag = sender.tag
        let selected = options[tag]
        print("Did select \(selected)")
        delegate?.rmSearchInputView(self, didSelectOption: selected)
        
        
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }
    
    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.placeHolderText
        self.viewModel = viewModel
    }
}

