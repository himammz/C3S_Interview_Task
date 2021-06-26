//
//  CategoryDetailsViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class CategoryDetailsViewController: UIViewController {

    
    @IBOutlet weak var collectionHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfResultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
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
            
            let carsCollectionViewController = self.children.first(where: {$0 is CarsCollectionViewController}) as! CarsCollectionViewController
            
            carsCollectionViewController.viewModel = CarsCollectionViewModel(carsViewModel: self.viewModel.carsCollectionViewModel)

        }
    }
    
    func setData(){
        title = "\(viewModel.categoryName) Details"
        categoryNameLabel.text = viewModel.categoryName
         numberOfResultLabel.text = "\(viewModel.carsCount) Results"
        categoryImageView.image = UIImage(named: viewModel.imageName)
        descriptionLabel.text = viewModel.description
    }

    
 
}
