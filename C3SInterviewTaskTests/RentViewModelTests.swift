//
//  RentViewModelTests.swift
//  C3SInterviewTaskTests
//
//  Created by Ibrahim on 27/06/2021.
//

import XCTest
@testable import C3SInterviewTask
import CoreData
class RentViewModelTests: XCTestCase {

 
    var rentViewModel:RentViewModel!
    
    
    override func setUp() {
        rentViewModel = RentViewModel(carModel: "ABC")
        rentViewModel.currentDate = Date()
        rentViewModel.numberOfDays = 5
        
    }
    
     func testStoreRecord() {
        let backgroundContext = rentViewModel.coreDataController.backgroundContext

        rentViewModel.storeRecord()
        backgroundContext?.performAndWait {
            
        }
        let fetchReuest:NSFetchRequest<Rent> = Rent.fetchRequest()
        let result = try? rentViewModel.coreDataController.viewContext.fetch(fetchReuest)
        
        XCTAssertEqual(result?.count, 1)
    }
    
    func testStoreRecordSameNumberOfDays() {
       let backgroundContext = rentViewModel.coreDataController.backgroundContext

       rentViewModel.storeRecord()
       backgroundContext?.performAndWait {
           
       }
       let fetchReuest:NSFetchRequest<Rent> = Rent.fetchRequest()
       let result = try? rentViewModel.coreDataController.viewContext.fetch(fetchReuest)
       
        XCTAssertEqual(result?.first?.numOfDays, Int32(rentViewModel.numberOfDays))
   }
   
    func testStoreRecordSameModelName() {
       let backgroundContext = rentViewModel.coreDataController.backgroundContext

       rentViewModel.storeRecord()
       backgroundContext?.performAndWait {
           
       }
       let fetchReuest:NSFetchRequest<Rent> = Rent.fetchRequest()
       let result = try? rentViewModel.coreDataController.viewContext.fetch(fetchReuest)
       
        XCTAssertEqual(result?.first?.carModel, rentViewModel.carModel)
   }

 
 
    
 
    func test_fetching_from_disk(){
        let backgroundContext = rentViewModel.coreDataController.backgroundContext
        rentViewModel.storeRecord()
        rentViewModel.storeRecord()
        rentViewModel.storeRecord()
        rentViewModel.storeRecord()

        let results = SavedCarsViewController().fetchAll()
        backgroundContext?.performAndWait {
            
        }

        XCTAssertEqual(results?.count, 4)
 
    }

 
    
    override func tearDown() {
        let backgroundContext = rentViewModel.coreDataController.backgroundContext
        backgroundContext?.performAndWait {
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = Rent.fetchRequest()
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            let  _ = try? backgroundContext?.execute(deleteRequest)
           try? backgroundContext?.save()
        }
    }
    
}
