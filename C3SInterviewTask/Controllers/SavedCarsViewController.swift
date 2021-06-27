//
//  SavedCarsViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import UIKit
import CoreData
class SavedCarsViewController: UITableViewController {
    let coreDataController = CoreDataController(modelName: "RentDB")

    var savedCars:[Rent] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        savedCars = fetchAll() ?? []
    }
    


    func fetchAll()->[Rent]?{
        let fetchReuest:NSFetchRequest<Rent> = Rent.fetchRequest()
        let result = try? coreDataController.viewContext.fetch(fetchReuest)
        return result
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedCars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell")!
        cell.textLabel?.text = savedCars[indexPath.row].carModel
        cell.detailTextLabel?.text = "\(savedCars[indexPath.row].numOfDays) days Start from "
        if let date = savedCars[indexPath.row].startDate {
            cell.detailTextLabel?.text! += "\(date)"
        }

        return cell
    }
    
}
