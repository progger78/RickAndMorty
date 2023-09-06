//
//  LocationViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 06.09.2023.
//

import Foundation



final class RMLocationViewViewModel {
    
    
    init(){}
    
    private let locations: [RMLocation] = []
    
    private let cellViewModels: [String] = []
    
    func fetchLocation() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    private var isLoadingMore = false
    

}
