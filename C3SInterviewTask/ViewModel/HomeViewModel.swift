//
//  HomeViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

class HomeViewModel{
    var categories:[CarCategoryViewModel] = []
     let fileName = "CarCategories"
    var numberOfIrems:Int{
        return categories.count
    }
    
    func itemAt(indexPath:IndexPath)-> CarCategoryViewModel{
        let category = categories[indexPath.item]
        return category
    }
    func laodData(completion:@escaping ()-> Void){
        JsonReader.readLocalJSONFile(forName: fileName) { [weak self] data in
            guard let data = data else {
                return
            }
            
            let obj = JsonReader.decode(type: [String:[CarCategory]].self, data: data) ?? [:]
            
            
            let categoriesObj = obj["data"] ?? []
            
            self?.categories = categoriesObj.map({(CarCategoryViewModel(category: $0))})
            
            completion()
        }
        
    }

}

struct CarCategoryViewModel{
      let category:CarCategory
    
    var categoryName:String{
        return category.name
    }
    
    var imageName : String{
        return category.imageName ?? ""
    }
}
