//
//  CategoryDetailsViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

class CategoryDetailsViewModel{
    var categoryName:String{
        return carCategory.name
    }
    var imageName:String{
        return carCategory.imageName ?? ""
    }
    var description:String{
        return carCategory.description ?? ""
    }

    let carCategory:CarCategory
    var carsCount:Int{
        return carsCollectionViewModel.count
    }
    

    var carsCollectionViewModel:[CarCollectionCellViewModel] = []
    let fileName = "carsRecords"
    
    
    init (carCategory:CarCategory){
        self.carCategory = carCategory
        
    }
    
    
    func laodData(completion:@escaping ()-> Void){
        JsonReader.readLocalJSONFile(forName: fileName) { [weak self] data in
            guard let data = data else {
                return
            }
            
            let obj = JsonReader.decode(type: [String:[Car]].self, data: data) ?? [:]
            let carsObj = obj["data"] ?? []
            
            self?.filterCars(allCars: carsObj)
            
            
            completion()
        }
        
    }
    
    func filterCars( allCars:[Car]) {
       let filterdCars = allCars.filter({$0.style == categoryName})
        carsCollectionViewModel = filterdCars.map({
            CarCollectionCellViewModel(car: $0)
        })
        
        
        
    }
    
    
    
    
}
