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
        tableView.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        return tableView
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(locationTableView, spinner)
        addConstraints()
        spinner.startAnimating()
        setTableView()
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
    
    func setTableView() {
        locationTableView.delegate = self
        locationTableView.dataSource = self
    }
    
    
}


extension RMLocationView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = viewModel?.cellViewModels else {
            fatalError()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMLocationTableViewCell.cellIdentifier, for: indexPath) as? RMLocationTableViewCell else {
            fatalError("not supported cell")
        }
        let viewModel = viewModels[indexPath.row]
        cell.textLabel?.text = viewModel.name
        return cell
    }
}
