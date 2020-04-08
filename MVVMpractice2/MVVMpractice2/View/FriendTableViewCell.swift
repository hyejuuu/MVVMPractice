//
//  FriendTableViewCell.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    var viewModel = FriendCellViewModel()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(nameLabel)
        
        nameLabel.centerYAnchor.constraint(
            equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }

    func bind(viewModel: FriendCellViewModel) {
        self.viewModel = viewModel
        
        viewModel.setGenderColor()
        
        nameLabel.text = viewModel.name
        
        viewModel.backgroundColor.addObserver { [weak self] color in
            self?.contentView.backgroundColor = color
        }
        
    }
    
}
