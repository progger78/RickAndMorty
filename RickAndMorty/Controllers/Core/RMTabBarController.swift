//
//  ViewController.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTubs()
   
    }
    
    
    func setUpTubs(){
        let charactersVC = RMCharactersVC()
        let episodesVC = RMEpisodesVC()
        let locationsVC = RMLocationsVC()
        let settingsVC = RMSettingsVC()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = TabBarIcons.characterIcon
        nav2.tabBarItem = TabBarIcons.locationIcon
        nav3.tabBarItem = TabBarIcons.episodesIcon
        nav4.tabBarItem = TabBarIcons.settingsIcon
        
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
    }

}

 
