//
//  DynamicValue.swift
//  MVVMpractice2
//
//  Created by 이혜주 on 09/04/2020.
//  Copyright © 2020 leehyeju. All rights reserved.
//

import Foundation

class DynamicValue<T> {

    var observers: [((T) -> Void)?] = []

    var value : T {
        didSet {
            self.notify()
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func addObserver(observer: @escaping (T) -> Void) {
        observers.append(observer)
    }
    
    func notify() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.observers.forEach { $0?(self.value) }
        }
    }
    
    func removeAll() {
        observers.removeAll()
    }
}
