//
//  HomeCollectionViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

 
class HomeCollectionViewController: UICollectionViewController {
    

    
    
    private let sectionInsets = UIEdgeInsets(top: 20,left: 20, bottom: 0,right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(CarHomeCollectionViewCell.nib, forCellWithReuseIdentifier: CarHomeCollectionViewCell.reuseIdentifier)
 
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

 

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarHomeCollectionViewCell.reuseIdentifier, for: indexPath) as! CarHomeCollectionViewCell
        cell.carImageView.image = #imageLiteral(resourceName: "sedan-car-model")
        cell.categoryNameLabel.text = "SUV"
        return cell
    }

    // MARK: UICollectionViewDelegate

 
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
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeCollectionViewController") as! WelcomeViewController
         return vc

    }
    static var Navigationinstance:UINavigationController{
        
        let navigationController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeNavigationController") as! UINavigationController
         return navigationController

    }

}
