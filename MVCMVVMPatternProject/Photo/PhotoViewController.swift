//
//  ViewController.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/12.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {

    let photoViewModel = PhotoViewModel()
    @IBOutlet var photoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        photoTableView.dataSource = self
        photoTableView.delegate = self
        photoTableView.rowHeight = 150
    
        photoViewModel.fechPhoto()
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "넷플", style: .plain, target: self, action: #selector(netFlixButtonTapped))
        
    }
    
    @objc func netFlixButtonTapped() {
        
        let vc = NetFlixViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }


}


extension PhotoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoViewModel.numberOfRowsInSectionCoun
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell") as? PhotoTableViewCell else {return UITableViewCell()}
        
        let data = photoViewModel.cellForRowAt(at: indexPath)
        let url = URL(string: data.urls.thumb)
        cell.photoImageView.kf.setImage(with: url)
        
   
        return cell
    }
    
    
}
