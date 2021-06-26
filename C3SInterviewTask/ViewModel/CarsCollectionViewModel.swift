//
//  CarsCollectionViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

struct CarsCollectionViewModel{
    let carsViewModel:[CarCollectionCellViewModel]
    
    var numberOfIrems:Int{
        return carsViewModel.count
    }
    
    func itemAt(indexPath:IndexPath)-> CarCollectionCellViewModel{
        let carVm = carsViewModel[indexPath.item]
        return carVm
    }
    
}




struct CarCollectionCellViewModel{
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
    
    var imageURL : URL{
        
        let urlString = car.carImg ?? ""
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
        return URL(string:escapedString)!
        
    }


}
