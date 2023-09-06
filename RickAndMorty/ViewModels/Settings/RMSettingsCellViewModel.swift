//
//  SettingsViewModel.swift
//  RickAndMorty
//
//  Created by 1 on 04.09.2023.
//

import Foundation
import UIKit


struct RMSettingsCellViewModel: Identifiable {
    
    let id = UUID()
    public var onTapHandler: (RMSettingsOptions) -> Void
    
    public var title: String {
        type.displayTitle
    }
    public var icon: UIImage? {
        type.displayIcon
    }
    
    public var iconContainerColor: UIColor {
        type.iconContainerColor
    }
    
    public let type: RMSettingsOptions
    init(type: RMSettingsOptions, onTapHandler: @escaping(RMSettingsOptions) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
}
