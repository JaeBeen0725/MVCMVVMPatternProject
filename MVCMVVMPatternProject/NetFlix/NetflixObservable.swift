//
//  NetflixObservable.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/13.
//

import Foundation


class NetflixObservable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
            print("didSet에서 실행중")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
   
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function, "bind 함수 안에서 실행중")
       closure(value)
        listener = closure
        
    }
    
    
}



