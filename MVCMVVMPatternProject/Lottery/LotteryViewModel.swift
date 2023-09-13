//
//  LotteryViewModel.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/13.
//

import Foundation

class LotteryViewModel {
    
    let lo = LotteryManager()
    
    var number1 = LotteryObservable(1)
    var number2 = LotteryObservable(1)
    var number3 = LotteryObservable(1)
    var number4 = LotteryObservable(1)
    var number5 = LotteryObservable(1)
    var number6 = LotteryObservable(1)
    var number7 = LotteryObservable(1)
    var lotteryMoney = LotteryObservable("당첨금")
    
    func format(for number: Int) -> String {
        
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
        
    }
    
    func fetchLottoAPI(drwNo: Int) {
        
        lo.lotteryAPI(query: drwNo) { lotto in
            self.number1.value = lotto.drwtNo1
            self.number2.value = lotto.drwtNo2
            self.number3.value = lotto.drwtNo3
            self.number4.value = lotto.drwtNo4
            self.number5.value = lotto.drwtNo5
            self.number6.value = lotto.drwtNo6
            self.number7.value = lotto.bnusNo
            self.lotteryMoney.value = self.format(for: lotto.totSellamnt)
        } failer: {
            print("error")
        }

            

       

        }
    }
    


