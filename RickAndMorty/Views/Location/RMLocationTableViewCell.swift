//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by 1 on 06.09.2023.
//

import UIKit

class RMLocationTableViewCell: UITableViewCell {

    static let cellIdentifier = "RMLocationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        
    }
    
    public func configure(with viewModel: RMLocationTableCellViewModel) {
        
    }

}
