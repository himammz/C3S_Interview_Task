//
//  CoreDataController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import Foundation
import CoreData

class CoreDataController {
    
    let persistentContainer:NSPersistentContainer
    var backgroundContext:NSManagedObjectContext!
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init (modelName:String){
        
        let bundle = Bundle(for: type(of: self))
        let modelURL = bundle.url(forResource: modelName, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)!
        
        persistentContainer = NSPersistentContainer(name: modelName,managedObjectModel: managedObjectModel)
        load(){ [self] in
            self.backgroundContext = persistentContainer.newBackgroundContext()
            self.configureContexts()
        }
    }

    func configureContexts() {
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }

 
    func load(completion: (()-> Void)? = nil){
        persistentContainer.loadPersistentStores{ storeDescription, error in
            guard error == nil else{
                fatalError("Can't Load Persistent Stores")
            }
             completion? ()
            
        }
        
    }
    
    
}


