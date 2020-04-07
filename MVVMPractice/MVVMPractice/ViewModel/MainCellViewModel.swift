//
//  MainCellViewModel.swift
//  MVVMPractice
//
//  Created by 이혜주 on 06/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainCellViewModel {
    var name: String
    var cellColor = BehaviorRelay<UIColor>(value: .clear)
    var textColor = BehaviorRelay<UIColor>(value: .black)
    
    init(fruit: Fruit) {
        self.name = fruit.name
        cellColor.accept(.clear)
        textColor.accept(.black)
    }
}
