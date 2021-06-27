//
//  CompanyTableViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import Foundation

struct CompanyTableViewModel{
    let companiesViewModel:[CompanySectionViewModel]
    
    var numberOfSections:Int{
        return companiesViewModel.count
    }
    
    
    
    func sectionAt(index:Int)-> CompanySectionViewModel{
        let companyVm = companiesViewModel[index]
        return companyVm
    }
    func rowAt(section:Int, row:Int)-> CarCellCellViewModel{
        let companyVm = companiesViewModel[section].itemAt(index: row)
        return companyVm
    }
    
    
}


class CompanySectionViewModel{
    var isOpen:Bool = false
    var cars:[CarCellCellViewModel] = []
    
    init (carsCellViewModels: [CarCellCellViewModel]){
        cars = carsCellViewModels
    }
    var numberOfItems:Int{
        return cars.count
    }
    var companyName:String{
        return cars.first!.companyName
    }
    
    
    var logoURL:URL{
        return cars.first!.logoURL
    }
    func itemAt(index:Int)-> CarCellCellViewModel{
        let car = cars[index]
        return car
    }
    
    
}



