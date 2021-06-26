//
//  CompanyTableViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class CompanyTableViewController: UITableViewController {

    
    var viewModel:CompanyTableViewModel?{
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CarCompanyTableViewCell.nib, forCellReuseIdentifier: CarCompanyTableViewCell.reuseIdentifier)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: CarCompanyTableViewCell.reuseIdentifier, for: indexPath) as! CarCompanyTableViewCell
        
        cell.cellViewModel = viewModel?.itemAt(indexPath: indexPath)
        (parent as? CategoryDetailsViewController)?.tableViewHeightConstrain.constant = tableView.contentSize.height

            return cell
     }
 
 
 
 
}
