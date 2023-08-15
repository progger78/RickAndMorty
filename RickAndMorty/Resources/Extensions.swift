//
//  Extensions.swift
//  RickAndMorty
//
//  Created by 1 on 15.08.2023.
//

import UIKit

extension UIView {
    func topPin(customView: UIView, view: UIView){
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
