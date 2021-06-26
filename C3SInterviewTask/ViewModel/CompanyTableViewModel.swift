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
    
    func itemAt(indexPath:IndexPath)-> CompanySectionViewModel{
        let companyVm = companiesViewModel[indexPath.section]
        return companyVm
    }
    
}


struct CompanySectionViewModel{
    var isOpen:Bool = false
    var cars:[CarCellCellViewModel] = []
    
    var numberOfItems:Int{
        return cars.count
    }
    var companyName:String{
        return cars.first!.companyName
    }

    
    var logoURL:URL{
        return cars.first!.logoURL
     }

}

 

