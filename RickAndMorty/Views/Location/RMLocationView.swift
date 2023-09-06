//
//  RMLocationView.swift
//  RickAndMorty
//
//  Created by 1 on 06.09.2023.
//

import UIKit

final class RMLocationView: UIView {
    
    private var viewModel: RMLocationViewViewModel? {
        didSet {
            spinner.stopAnimating()
            locationTableView.isHidden = false
            locationTableView.reloadData()
            UIView.animate(withDuration: 0.4, animations: {
                self.locationTableView.alpha = 1
            })
        }
    }
    
    let locationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        tableView.alpha = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemCyan
        addSubviews(locationTableView, spinner)
        addConstraints()
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            locationTableView.topAnchor.constraint(equalTo: topAnchor),
            locationTableView.leftAnchor.constraint(equalTo: leftAnchor),
            locationTableView.rightAnchor.constraint(equalTo: rightAnchor),
            locationTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            spinner.heightAnchor.constraint(equalToConstant: 40),
            spinner.heightAnchor.constraint(equalToConstant: 40),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: RMLocationViewViewModel) {
        self.viewModel = viewModel
    }
    
    
}
