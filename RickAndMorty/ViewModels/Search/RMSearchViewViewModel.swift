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
    
    private var searchResultsHandler: (() -> Void)?
    
    init(config: RMSearchVC.Config) {
        self.config = config
    }
    //  https://rickandmortyapi.com/api/character/?name=rick&status=alive
    
    
    public func registerSearchResultsHandler(_ block: @escaping () -> Void) {
        self.searchResultsHandler = block
    }
    public func executeSearch() {
        //        Test text
        searchText = "Rick"
        //        Build arguments
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText)]
        //        Add options
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.querryParameter, value: value)
        }))
        //        Create request
        let request = RMRequest(endPoint: config.type.endPoint, queryParameters: queryParams)
        
        //        Fetch data
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case.success(let response):
                //                self.searchResultsHandler = response.results
                print("amount of characters is \(response.results.count)")
            case .failure(let error):
                print(String(describing: error))
            }
        }
        //        Notify view with changes
        
        
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
