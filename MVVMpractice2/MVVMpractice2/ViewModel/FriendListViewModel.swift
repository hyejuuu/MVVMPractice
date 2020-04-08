//
//  FriendListViewModel.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation

class FriendListViewModel {
    
    private let friendService = FriendService()
    
    var friendCellViewModels: DynamicValue<[FriendCellViewModel]> = .init(value: [])
    
    func makeFriendCellViewModels() {
        friendService.fetchList { [weak self] result in
            switch result {
            case .success(let friends):
                self?.friendCellViewModels.value
                    = friends.map { FriendCellViewModel(name: $0.name,
                                                        age: $0.age,
                                                        gender: $0.gender) }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
}
