//
//  Service.swift
//  MVVMPractice
//
//  Created by 이혜주 on 06/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation
import RxSwift

class NewService {
    let oldSerivce = OldService()
    
    func fetchList() -> Observable<[String]> {
        let result = Observable<[String]>.create { [weak self] observer -> Disposable in
            self?.oldSerivce.fetchList(completion: { result in
                switch result {
                case .success(let list):
                    observer.onNext(list)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        }
        return result
    }
}

class OldService {
    func fetchList(completion: @escaping (Result<[String], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             let successResult = ["체리", "포도", "딸기", "파인애플", "사과", "배", "감", "귤", "망고", "키위"]
                   completion(.success(successResult))
        }
    }
}
