//
//  DetailViewController.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 09/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var viewModel = DetailViewModel()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("즐겨찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(touchUpBookmarkButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(bookmarkButton)
        
        nameLabel.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 100).isActive = true
        nameLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        
        ageLabel.topAnchor.constraint(
            equalTo: nameLabel.bottomAnchor,
            constant: 20).isActive = true
        ageLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        
        genderLabel.topAnchor.constraint(
            equalTo: ageLabel.bottomAnchor,
            constant: 20).isActive = true
        genderLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        
        bookmarkButton.topAnchor.constraint(
            equalTo: genderLabel.bottomAnchor,
            constant: 20).isActive = true
        bookmarkButton.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
    }
    
    func bind(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
        nameLabel.text = viewModel.name
        ageLabel.text = viewModel.age
        genderLabel.text = viewModel.gender
        
        viewModel.buttonColor.addObserver { [weak self] color in
            self?.bookmarkButton.backgroundColor = color
        }
        
        viewModel.buttonTitleColor.addObserver { [weak self] color in
            self?.bookmarkButton.setTitleColor(color,
                                               for: .normal)
        }
    }
    
    @objc private func touchUpBookmarkButton() {
        viewModel.changeButtonColor()
    }
}
