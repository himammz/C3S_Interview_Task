//
//  CategoryDetailsViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

class CategoryDetailsViewModel{
    let categoryName:String
    let imageName:String
    var carsCount:Int{
        return cars.count
    }
    

    var cars:[Car] = []
    let fileName = "carsRecords"
    
    
    init (categoryName:String,imageName:String){
        self.categoryName = categoryName
        self.imageName = imageName
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
       cars = allCars.filter({$0.style == categoryName})
    }
    
    
    
    
}
