//
//  MainViewModel.swift
//  MVVMPractice
//
//  Created by 이혜주 on 06/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    private let service = NewService()
    private let disposeBag = DisposeBag()
   
    var cellViewModels = BehaviorRelay<[MainCellViewModel]>(value: [])
    
    func requestCellViewModels() {
        service.fetchList()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                let cellViewModels = result.map {
                    MainCellViewModel(fruit: Fruit(name: $0))
                }
                self?.cellViewModels.accept(cellViewModels)
            }).disposed(by: disposeBag)
    }
    
    func clickedCell(at Index: Int) {
        cellViewModels.value[Index].cellColor.accept(.black)
        cellViewModels.value[Index].textColor.accept(.white)
    }
}

