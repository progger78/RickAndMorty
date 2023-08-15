//
//  RMCharactersVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMCharactersVC: UIViewController {
    
    
    private let charactersListView = CharactersListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        view.addSubview(charactersListView)
        view.topPin(customView: charactersListView, view: view)
        
    }
    
}





