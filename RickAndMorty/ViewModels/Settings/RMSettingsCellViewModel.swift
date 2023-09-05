//
//  SettingsViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 04.09.2023.
//

import Foundation
import UIKit


struct RMSettingsCellViewModel {
    public var title: String {
        type.displayTitle
    }
    public var icon: UIImage? {
        type.displayIcon
    }
    
    public let type: RMSettingsOptions
    init(type: RMSettingsOptions) {
        self.type = type
    }
}
