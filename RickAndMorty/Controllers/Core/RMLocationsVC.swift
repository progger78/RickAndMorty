//
//  RMLocationsVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMLocationsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        view.backgroundColor = .systemBackground
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
