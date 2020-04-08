//
//  DetailViewModel.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 09/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import UIKit

class DetailViewModel {
    let name: String
    var age: String
    let gender: String
    let buttonColor: DynamicValue<UIColor> = .init(value: .white)
    let buttonTitleColor: DynamicValue<UIColor> = .init(value: .black)
    
    init(name: String = "", age: Int = 0, gender: Gender = .male) {
        self.name = name
        self.age = "\(age)"
        self.gender = gender.rawValue
    }
    
    func changeButtonColor() {
        if buttonColor.value == .white {
            buttonColor.value = .black
            buttonTitleColor.value = .white
        } else {
            buttonColor.value = .white
            buttonTitleColor.value = .black
        }
    }
    
}
