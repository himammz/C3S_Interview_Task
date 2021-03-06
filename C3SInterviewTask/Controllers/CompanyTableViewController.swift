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
        
        tableView.register(CarTableViewCell.nib, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        
        tableView.register(CarCompanyTableViewCell.nib, forCellReuseIdentifier: CarCompanyTableViewCell.reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        (parent as? CategoryDetailsViewController)?.tableViewHeightConstrain.constant = self.tableView.contentSize.height
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionVm = viewModel?.sectionAt(index:section)
        if sectionVm?.isOpen == true{
            return (sectionVm?.numberOfItems ?? 0 ) + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: CarCompanyTableViewCell.reuseIdentifier, for: indexPath) as! CarCompanyTableViewCell
            
            cell.cellViewModel = viewModel?.sectionAt(index: indexPath.section)
            
            
            return cell
            
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath) as! CarTableViewCell
            
            let item = viewModel?.rowAt(section: indexPath.section ,row: (indexPath.row - 1))
            cell.cellViewModel = item
            
            return cell
        }
        
        
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sectionVm = viewModel?.sectionAt(index: indexPath.section)
            sectionVm?.isOpen = !(sectionVm?.isOpen ?? true)
            let indexSet = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexSet, with: .none)
            
        }else {
            let vm = viewModel?.rowAt(section: indexPath.section, row: indexPath.row - 1)
            
            guard vm?.isAvailable == true else {
                return
            }
            let rentViewController = RentDateViewController.instance
            rentViewController.viewModel = RentViewModel(carModel: vm?.model ?? "" )
            
            present(rentViewController, animated: true, completion: nil)
        }
        
    }
    
    
    override  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    
    
    
    
}
