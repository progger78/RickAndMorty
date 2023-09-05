//
//  SettingsOptions.swift
//  RickAndMorty
//
//  Created by 1 on 04.09.2023.
//

import Foundation
import UIKit


enum RMSettingsOptions: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact us"
        case .terms:
            return "Terms"
        case .privacy:
            return "Privacy"
        case .apiReference:
            return "Api Reference"
        case .viewSeries:
            return "View series"
        case .viewCode:
            return "View code"
        }
    }
    
    var displayIcon: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "")
        case .contactUs:
            return UIImage(systemName: "")
        case .terms:
            return UIImage(systemName: "")
        case .privacy:
            return UIImage(systemName: "")
        case .apiReference:
            return UIImage(systemName: "")
        case .viewSeries:
            return UIImage(systemName: "")
        case .viewCode:
            return UIImage(systemName: "")
        }
    }
}
