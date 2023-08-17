//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by 1 on 15.08.2023.
//

import UIKit


///  View that handles loader, list of characters etc.
final class RMCharactersListView: UIView {

    private let viewModel = RMCharactersListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.backgroundColor = .systemBackground
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.collectionCellIdentifier)
        return collectionView
    }()

    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(collectionView, spinner)
        setConstraints()
        viewModel.fetchCharacters()
        spinner.startAnimating()
        setupCollectionView()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupCollectionView(){
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
            })
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
            }
            )}
        )}
    
}































//    private let spinner: UIActivityIndicatorView = {
//        let spinner = UIActivityIndicatorView(style: .large)
//        spinner.hidesWhenStopped = true
//        spinner.translatesAutoresizingMaskIntoConstraints = false
//        return spinner
//    }()
//
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.isHidden = true
//        collectionView.alpha = 0
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        return collectionView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
//        addSubviews(collectionView, spinner)
//        addConstraints()
//        spinner.startAnimating()
//        viewModel.fetchCharacters()
//        setCollectionView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func addConstraints(){
//        NSLayoutConstraint.activate([
//            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
//            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
//            spinner.heightAnchor.constraint(equalToConstant: 100),
//            spinner.widthAnchor.constraint(equalToConstant: 100),
//
//            collectionView.topAnchor.constraint(equalTo: topAnchor),
//            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
//            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
//
//        ])
//    }
//
//    private func setCollectionView(){
//        collectionView.dataSource = viewModel
//        collectionView.delegate = viewModel
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute: {
//            self.spinner.stopAnimating()
//            self.collectionView.isHidden = false
//            UIView.animate(withDuration: 0.4, animations: {
//                self.collectionView.alpha = 1
//            })
//        })
//    }

