//
//  FriendCellViewModel.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit

class FriendCellViewModel {
    let name: String
    let age: Int
    let gender: Gender
    let backgroundColor: DynamicValue<UIColor> = .init(value: .clear)
    
    init(name: String = "", age: Int = 0, gender: Gender = .male) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func setGenderColor() {
        switch gender {
        case .male:
            backgroundColor.value = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case .female:
            backgroundColor.value = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
}
