//
//  HomeCollectionViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

 import MBProgressHUD
class HomeCollectionViewController: UICollectionViewController {
    private let sectionInsets = UIEdgeInsets(top: 20,left: 20, bottom: 0,right: 20)

    let viewModel:HomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

         // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(CarHomeCollectionViewCell.nib, forCellWithReuseIdentifier: CarHomeCollectionViewCell.reuseIdentifier)
        navigationController?.navigationBar.tintColor = .white
        loadData()
    }
    func loadData(){
        showHUD()
         viewModel.laodData(){ [weak self] in
            self?.hideHUD()
            self?.collectionView.reloadData()
        }
    }
 
    
    
    @IBAction func logoutAction(_ sender: Any) {
        
        User.remove()
        AppDelegate.rootViewController = LoginViewController.instance
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfIrems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarHomeCollectionViewCell.reuseIdentifier, for: indexPath) as! CarHomeCollectionViewCell
        
         cell.carCategoryViewModel = viewModel.itemAt(indexPath: indexPath)
        
         return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellVm = viewModel.itemAt(indexPath: indexPath)
        let detailsViewController = CategoryDetailsViewController.instance
        detailsViewController.viewModel = CategoryDetailsViewModel(carCategory: cellVm.category)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

 
}


// MARK: - Collection View Flow Layout Delegate
extension HomeCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * 2
        var availableWidth = collectionView.frame.width - paddingSpace
        availableWidth -= 6 // space between cells
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem , height:200)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
 }
extension HomeCollectionViewController{
    static var instance:WelcomeViewController{
        let vc =  UIStoryboard(name: "Car", bundle: nil).instantiateViewController(withIdentifier: "homeCollectionViewController") as! WelcomeViewController
         return vc

    }
    static var Navigationinstance:UINavigationController{
        
        let navigationController =  UIStoryboard(name: "Car", bundle: nil).instantiateViewController(withIdentifier: "homeNavigationController") as! UINavigationController
         return navigationController

    }

}
