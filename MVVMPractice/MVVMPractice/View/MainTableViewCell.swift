//
//  MainTableViewCell.swift
//  MVVMPractice
//
//  Created by 이혜주 on 06/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit
import RxSwift

class MainTableViewCell: UITableViewCell {

    var disposeBag = DisposeBag()
    var viewModel = MainCellViewModel(fruit: Fruit(name: ""))
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(viewModel: MainCellViewModel) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.name
        
        viewModel.textColor.asObservable()
            .subscribe(onNext: { [weak self] color in
                self?.titleLabel.textColor = color
            })
            .disposed(by: disposeBag)
        
        viewModel.cellColor.asObservable()
            .subscribe(onNext: { [weak self] color in
                self?.contentView.backgroundColor = color
            })
            .disposed(by: disposeBag)
    }
    
    private func setupLayout() {
        contentView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(
            equalTo: contentView.centerYAnchor).isActive = true
    }

}
