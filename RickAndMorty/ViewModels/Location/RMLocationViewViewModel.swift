//
//  LocationViewViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 06.09.2023.
//

import Foundation



protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchLocations()
}

final class RMLocationViewViewModel {
    
    init(){}
    
    public weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let viewModel = RMLocationCellViewModel(location: location)
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
         
                
            }
        }
    }
    
    func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return locations[index]
    }
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationCellViewModel] = []
    
    func fetchLocation() {
        RMService.shared.execute(.listLocationsRequest, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchLocations()
                }
        
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    private var isLoadingMore: Bool {
        return false
    }
    

}
