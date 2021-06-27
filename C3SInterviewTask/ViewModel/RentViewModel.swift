//
//  RentViewModel.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import Foundation
import CoreData
class RentViewModel{
    
    let coreDataController = CoreDataController(modelName: "RentDB")
    let semaphoreForSaving = DispatchSemaphore(value: 1)
    
    var currentDate:Date?
    var numberOfDays:Int = 0
    var carModel:String
    init (carModel:String){
        self.carModel = carModel
        print (fetchAll())
    }
     func storeRecord(){
        let backgroundContext = coreDataController.backgroundContext!
        backgroundContext.perform { [weak self] in
            guard let self = self else {return}
            let recordToStore = Rent(context: backgroundContext)
            recordToStore.carModel = self.carModel
            recordToStore.startDate = self.currentDate
            recordToStore.numOfDays = Int32(self.numberOfDays)
            self.saveContext()
        }
    }
      func saveContext(){
        let backgroundContext = coreDataController.backgroundContext
        semaphoreForSaving.wait()
        if let backgroundContext = backgroundContext, backgroundContext.hasChanges{
            try?  backgroundContext.save()
        }
        semaphoreForSaving.signal()
    }

    func fetchAll()->[Rent]?{
        let fetchReuest:NSFetchRequest<Rent> = Rent.fetchRequest()
        let result = try? coreDataController.viewContext.fetch(fetchReuest)
        return result
    }

    
}
