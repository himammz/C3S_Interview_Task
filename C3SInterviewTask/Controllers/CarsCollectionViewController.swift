//
//  CarsCollectionViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

 
class CarsCollectionViewController: UICollectionViewController {

    private let sectionInsets = UIEdgeInsets(top: 20,left: 20, bottom: 0,right: 20)

    var viewModel:CarsCollectionViewModel?{
        didSet{
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

         // Register cell classes
        self.collectionView!.register(CarDetailsCollectionViewCell.nib, forCellWithReuseIdentifier: CarDetailsCollectionViewCell.reuseIdentifier)
        
        

     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
 
 
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfIrems ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailsCollectionViewCell.reuseIdentifier, for: indexPath) as!  CarDetailsCollectionViewCell
    
        cell.cellViewModel = viewModel?.itemAt(indexPath: indexPath)
 
        (parent as? CategoryDetailsViewController)?.collectionHeightConstrain.constant = collectionView.contentSize.height
         return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
 
 
    }
  

}

// MARK: - Collection View Flow Layout Delegate
extension CarsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * 2
        var availableWidth = collectionView.frame.width - paddingSpace
        availableWidth -= 6 // space between cells
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem , height:250)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
 }
