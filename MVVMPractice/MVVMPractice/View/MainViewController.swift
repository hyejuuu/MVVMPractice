//
//  MainViewController.swift
//  MVVMPractice
//
//  Created by 이혜주 on 06/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    private var viewModel = MainViewModel()
    private var disposeBag = DisposeBag()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        bind(viewModel: MainViewModel())
        setupLayout()
        setupTableView()
    }
    
    // viewModel과 View를 binding하기 위한 메소드
    func bind(viewModel: MainViewModel) {
        self.viewModel = viewModel
        viewModel.requestCellViewModels()
        viewModel.cellViewModels.asObservable().subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainTableViewCell.self,
                           forCellReuseIdentifier: "tableViewCell")
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        viewModel.clickedCell(at: indexPath.row)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell
            = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")
                as? MainTableViewCell else {
            return .init()
        }
        
        cell.bind(viewModel: viewModel.cellViewModels.value[indexPath.row])
        
        return cell
    }
}
