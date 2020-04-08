//
//  Service.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 08/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation

class FriendService {
    func fetchList(completion: @escaping (Result<[Person], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let successResult = [Person(name: "고상범", age: 27, gender: .male),
                                 Person(name: "이혜슬", age: 27, gender: .female),
                                 Person(name: "이혜정", age: 24, gender: .female),
                                 Person(name: "신누리", age: 26, gender: .female),
                                 Person(name: "이혜주", age: 26, gender: .female),
                                 Person(name: "이재이", age: 26, gender: .female),
                                 Person(name: "이혜원", age: 26, gender: .female)]
            completion(.success(successResult))
        }
    }
}

