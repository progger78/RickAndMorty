//
//  RMSettingsVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMSettingsVC: UIViewController {

    let viewModel = RMSettingsViewViewModel(cellViewModels: RMSettingsOptions.allCases.compactMap({
        return RMSettingsCellViewModel(type: $0)
    }))
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    


}
