//
//  LotteryViewController.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/14.
//

import UIKit

class LotteryViewController: UIViewController {
    
    let lotteryViewModel = LotteryViewModel()
    
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    
    @IBOutlet var label7: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lotteryViewModel.fetchLottoAPI(drwNo: 1080)
        
        
        bindData()
    }
    
    func bindData() {
        
        lotteryViewModel.number1.bind { value in
            self.label1.text = "\(value)"
        }
        lotteryViewModel.number2.bind { value in
            self.label2.text = "\(value)"
        }
        lotteryViewModel.number3.bind { value in
            self.label3.text = "\(value)"
        }
        lotteryViewModel.number4.bind { value in
            self.label4.text = "\(value)"
        }
        lotteryViewModel.number5.bind { value in
            self.label5.text = "\(value)"
        }
        lotteryViewModel.number6.bind { value in
            self.label6.text = "\(value)"
        }
        lotteryViewModel.number7.bind { value in
            self.label7.text = "\(value)"
        }
        lotteryViewModel.lotteryMoney.bind { money in
            self.dateLabel.text = "\(money)"
        }
        
    }
    
    
}
