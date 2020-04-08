//
//  Person.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let age: Int
    let gender: Gender
}

enum Gender: String {
    case male = "남"
    case female = "여"
}
