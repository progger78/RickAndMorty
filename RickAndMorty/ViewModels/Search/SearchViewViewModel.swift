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

struct RMSearchViewViewModel {
    
    let config: RMSearchVC.Config
    
    init(config: RMSearchVC.Config) {
        self.config = config
    }
}
