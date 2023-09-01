//
//  RMCharactereEpisodesCollectionViewCell.swift
//  RickAndMorty
//
//  Created by 1 on 26.08.2023.
//

import UIKit

class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "RMCharactereEpisodesCollectionViewCell"
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(seasonLabel, nameLabel, airDateLabel)
        createCellStyle()
        addConstraints()
    }
    
    private func createCellStyle() {
        contentView.backgroundColor = .tertiarySystemFill
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: 3),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            

            
        ])
    }
    
    
    
    public func configure(with viewModel: RMCharactereEpisodesCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.seasonLabel.text = "Episode \(data.episode)"
            self?.nameLabel.text = "Name: \(data.name)"
            self?.airDateLabel.text = "Aired on: \(data.air_date)"
            self?.contentView.layer.borderColor = viewModel.borderColor?.cgColor
        }
        viewModel.fetchEpisode()
    }
    
}
