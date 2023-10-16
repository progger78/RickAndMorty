//
//  SearchViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 09.09.2023.
//

import Foundation

// Responsibilities

// Show results View
// Show no results view
// Kick off api call

final class RMSearchViewViewModel {
    
    let config: RMSearchVC.Config
    
    public var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    
    private var searchText = ""
    
    init(config: RMSearchVC.Config) {
        self.config = config
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option: option, value: value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func set(querry text: String) {
        self.searchText = text
    }
    
    
    
    public func registerOptionChangeBloc(_ block: @escaping((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}
