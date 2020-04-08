//
//  FriendListViewController.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {

    var viewModel = FriendListViewModel()
    
    private let friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(viewModel: FriendListViewModel())
        setupTableView()
        setupLayout()
    }
    
    private func setupTableView() {
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        
        friendListTableView.register(FriendTableViewCell.self,
                                     forCellReuseIdentifier: "friendCell")
    }
    
    private func setupLayout() {
        view.addSubview(friendListTableView)
        
        friendListTableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        friendListTableView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        friendListTableView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        friendListTableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    func bind(viewModel: FriendListViewModel) {
        self.viewModel = viewModel
        
        viewModel.makeFriendCellViewModels()
        viewModel.friendCellViewModels.addObserver { [weak self] (_) in
            self?.friendListTableView.reloadData()
        }
    }

}

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let personInfo = viewModel.friendCellViewModels.value[indexPath.row]
        detailViewController.bind(viewModel: DetailViewModel(name: personInfo.name,
                                                             age: personInfo.age,
                                                             gender: personInfo.gender))
        present(detailViewController, animated: true)
    }
}

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendCellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell
            = tableView.dequeueReusableCell(withIdentifier: "friendCell")
                as? FriendTableViewCell else {
            return .init()
        }
        
        cell.bind(viewModel: viewModel.friendCellViewModels.value[indexPath.row])
        
        return cell
    }
    
    
}
