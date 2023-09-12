//
//  Observable.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void?)?
    
    var value: T {        
        didSet {
            listener?(value)
            print(listener?(value))
        }
    }
    
    init(_ value: T) {
        self.value = value
        print("111", value)
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
    
    
}
