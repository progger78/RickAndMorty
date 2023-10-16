//
//  RMSearchOptionPickerVC.swift
//  RickAndMorty
//
//  Created by 1 on 10.09.2023.
//

import UIKit

class RMSearchOptionPickerVC: UIViewController {

    let option: RMSearchInputViewViewModel.DynamicOption
    let selectionBlock: ((String) -> Void)
    
    private var tableView:  UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(option: RMSearchInputViewViewModel.DynamicOption, selection: @escaping(String) -> Void) {
        self.option = option
        self.selectionBlock = selection
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setTableView()
     
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
 
    
 
}

extension RMSearchOptionPickerVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option.choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let option = option.choices[indexPath.row]
        cell.textLabel?.text = option.uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let choice = option.choices[indexPath.row]
        self.selectionBlock(choice)
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
