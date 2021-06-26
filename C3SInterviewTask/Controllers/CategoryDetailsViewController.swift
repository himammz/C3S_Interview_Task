//
//  CategoryDetailsViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class CategoryDetailsViewController: UIViewController {

    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfResultLabel: UILabel!
    
    
    static var instance:CategoryDetailsViewController{
        let vc =  UIStoryboard(name: "Car", bundle: nil).instantiateViewController(withIdentifier: "categoryDetailsViewController") as! CategoryDetailsViewController
         return vc

    }

    var viewModel:CategoryDetailsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryImageView.layer.cornerRadius = categoryImageView.frame.width / 2
        loadData()
     }
    
    
    
    func loadData(){
        viewModel.laodData { [weak self] in
            self?.setData()
        }
    }
    
    func setData(){
        title = "\(viewModel.categoryName) Details"
        categoryNameLabel.text = viewModel.categoryName
         numberOfResultLabel.text = "\(viewModel.carsCount) Results"
        categoryImageView.image = UIImage(named: viewModel.imageName)

    }
 
}
