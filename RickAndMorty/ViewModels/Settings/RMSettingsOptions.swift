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
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var url: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://rickandmortyshop.com/contact-us/")
        case .privacy:
            return URL(string: "https://rickandmortyshop.com/privacy-policy/")
        case .apiReference:
            return URL(string: "https://rickandmortyapi.com/documentation/#introduction")
        case .viewSeries:
            return URL(string: "https://www.youtube.com/playlist?list=PL5PR3UyfTWvdl4Ya_2veOB6TM16FXuv4y")
        case .viewCode:
            return URL(string: "https://github.com/progger78/RickAndMorty")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact us"
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
            return UIImage(systemName: "star")
        case .contactUs:
            return UIImage(systemName: "globe")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "link")
        case .viewSeries:
            return UIImage(systemName: "play.tv.fill")
        case .viewCode:
            return UIImage(systemName: "keyboard")
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemRed
        case .contactUs:
            return .systemTeal
        case .privacy:
            return .systemYellow
        case .apiReference:
            return .systemMint
        case .viewSeries:
            return.systemOrange
        case .viewCode:
            return .systemCyan
        }
    }
}
