//
//  LotteryManager.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/13.
//

import Foundation
import Alamofire

class LotteryManager {
  
    
    static let shard = LotteryManager()
    
    func lotteryAPI(query: Int, success: @escaping (Lotto) -> Void, failer: @escaping () -> Void ) {
        
      let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(query)"
        AF.request(url, method: .get).validate().responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value): success(value)
                
            case .failure(let error):
                print(error)
                failer()
            }
        }
    }
    
    
}
 
