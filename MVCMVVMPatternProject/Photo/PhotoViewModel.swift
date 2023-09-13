//
//  PhotoViewModel.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/12.
//

import Foundation


class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fechPhoto() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo = photo else { return }
            //print("=============", photo.results?.count)
            self.list.value = photo
        //    print(self.list.value )
        }
    }
    
    
    var numberOfRowsInSectionCoun: Int {
        
        self.list.value.results?.count ?? 0
        
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult{
        self.list.value.results![indexPath.row]
        
    }
        
    
    
    
    
}
