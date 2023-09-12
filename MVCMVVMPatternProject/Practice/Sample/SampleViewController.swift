//
//  SampleViewController.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/12.
//

import UIKit

struct User {
    let name: String
    let age: Int
    
    var introduce: String {
        return "\(name), \(age)살"
    }
    
}


class SampleViewController: UIViewController {
    
    let sampleViewModel = SampleViewModel()
    
    @IBOutlet var sampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number1 = Observable(10)
        let number2 = Observable(3)
        
        number1.bind { number in
            let a = number1.value - number2.value
            print(a)
        }
  
        number1.value = 10
        number2.value = 100
             
        
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
    }
    
    
}

extension SampleViewController: UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleViewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "smapleCell") else {return UITableViewCell() }
        let data = sampleViewModel.cellfotRowAt(at: indexPath)
        
        cell.textLabel?.text = data.introduce
        
        return cell
    }
    
  
}



