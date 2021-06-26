//
//  CarHomeCollectionViewCell.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

class CarHomeCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    var carCategoryViewModel:CarCategoryViewModel!{
        didSet{
            categoryNameLabel.text = carCategoryViewModel.categoryName
            carImageView.image = UIImage(named: carCategoryViewModel.imageName)
        }
    }
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }

}

