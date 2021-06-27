//
//  CarsCollectionViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

struct CarsCollectionViewModel{
    let carsCellViewModel:[CarCellCellViewModel]
    
    var numberOfIrems:Int{
        return carsCellViewModel.count
    }
    
    func itemAt(indexPath:IndexPath)-> CarCellCellViewModel{
        let carVm = carsCellViewModel[indexPath.item]
        return carVm
    }
    
}




struct CarCellCellViewModel{
    let car:Car
    
    var model:String{
        return car.carModel ?? ""
    }
    
    var companyName:String{
        return car.carCompany ?? ""
    }

    var availability:String{
        return car.isAvailable == true ?  "Available"  : "Not Available"
    }
    var isAvailable:Bool {
        return car.isAvailable ?? false
    }
    var imageURL : URL{
        
        let urlString = car.carImg ?? ""
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
        return URL(string:escapedString)!
        
    }
    var logoURL : URL{
        
        let urlString = car.logo ?? ""
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
        return URL(string:escapedString)!
        
    }



}
