//
//  SampleViewModel.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/12.
//

import Foundation

class SampleViewModel {
    
    var list = [User(name: "닭고기", age: 1), User(name: "돼지고기", age: 2), User(name: "소고기", age: 3)]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellfotRowAt(at indexPath: IndexPath) -> User {
        
        return list[indexPath.row]
        
    }
    
}
