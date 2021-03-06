//
//  CategoryDetailsViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class CategoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableViewHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var collectionHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfResultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var tableContainer: UIView!

    @IBOutlet weak var bottomCollectionSpace: NSLayoutConstraint!
    @IBOutlet weak var bottomTableSpace: NSLayoutConstraint!

    
    
    static var instance:CategoryDetailsViewController{
        let vc =  UIStoryboard(name: "Car", bundle: nil).instantiateViewController(withIdentifier: "categoryDetailsViewController") as! CategoryDetailsViewController
        return vc
        
    }
    
    var viewModel:CategoryDetailsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryImageView.layer.cornerRadius = categoryImageView.frame.width / 2
        setData()
        
        loadData()
        
    }
    
    
    
    func loadData(){
        showHUD()
        viewModel.laodData { [weak self] in
            self?.hideHUD()
            guard let self = self else {
                return
            }
            
            
            for child in self.children {
                if let childVC = child as? CarsCollectionViewController{
                    
                    childVC.viewModel = self.viewModel.getCarsCollectionViewModel()
                    
                }else if let childVC = child as? CompanyTableViewController{
                    
                    childVC.viewModel = self.viewModel.getCompanyTableViewModel()
                    
                }
            }
            
            
            self.numberOfResultLabel.text = "\(self.viewModel.carsCount) Results"
            
        }
    }
    
    func setData(){
        title = "\(viewModel.categoryName) Details"
        categoryNameLabel.text = viewModel.categoryName
        categoryImageView.image = UIImage(named: viewModel.imageName)
        descriptionLabel.text = viewModel.description
    }
    
    
    @IBAction func gridButtonAction(_ sender: Any) {
        collectionContainer.isHidden = false
        tableContainer.isHidden = true
        bottomCollectionSpace.priority = .required
        bottomTableSpace.priority = .defaultLow
    }
    
    @IBAction func listButtonAction(_ sender: Any) {
        
        collectionContainer.isHidden = true
        tableContainer.isHidden = false
        bottomCollectionSpace.priority = .defaultLow
        bottomTableSpace.priority = .required

    }
}
