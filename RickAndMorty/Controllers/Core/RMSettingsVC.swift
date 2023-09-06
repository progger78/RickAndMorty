//
//  RMSettingsVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit
import SwiftUI
import SafariServices
import StoreKit

final class RMSettingsVC: UIViewController {
    
    private var settingsSwiftUiController: UIHostingController<RMSettingsView>?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        addSwiftUiController()
    }
    
    private func addSwiftUiController() {
        let settingsSwiftUiController =  UIHostingController(rootView: RMSettingsView(viewModel: RMSettingsViewViewModel(cellViewModels: RMSettingsOptions.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0) { [weak self] option in
                self?.handleOptionTap(option: option)
            }
        }))))
        addChild(settingsSwiftUiController)
        settingsSwiftUiController.didMove(toParent: self)
        view.addSubviews(settingsSwiftUiController.view)
        settingsSwiftUiController.view.translatesAutoresizingMaskIntoConstraints = false
        view.topPin(customView: settingsSwiftUiController.view, view: view)
        
        self.settingsSwiftUiController = settingsSwiftUiController
      
    }
                    
    private func handleOptionTap(option: RMSettingsOptions) {
        guard Thread.current.isMainThread else {
            return
        }
        
        if let url = option.url {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        } else if option == .rateApp {
            if let window = view.window?.windowScene {
                SKStoreReviewController.requestReview(in: window)
            }
        }
    }
                                                                                         
    


}
