//
//  RMLocationsVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMLocationsVC: UIViewController {
    
    let primaryView = RMLocationView()
    
    let viewModel = RMLocationViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        view.backgroundColor = .systemBackground
        view.addSubviews(primaryView)
        viewModel.fetchLocation()
        viewModel.delegate = self
        view.topPin(customView: primaryView, view: view)
        addSearchButton()
        
        
    }
    
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    @objc private func didTapSearch(){
        let vc = RMSearchVC(config: RMSearchVC.Config(type: .location))
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RMLocationsVC: RMLocationViewViewModelDelegate {
    func didFetchLocations() {
        print("did fetch")
        primaryView.configure(with: viewModel)
    }
}
