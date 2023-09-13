//
//  NetFlix.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/13.
//

import Foundation


class NetFlixViewModel {
    
    var email = NetflixObservable("")
    var isValid = NetflixObservable(false)
    
    func checkValidation() {
        
        if email.value.count <= 5 && email.value.count >= 2 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completion: @escaping () -> Void ) {
        // 서버 통신
        
        // response
        
        // 통신 성공햇을떄
        completion()
        
        // 실패
        // 에러 처리
    }
   
}
