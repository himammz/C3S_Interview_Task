//
//  CarDetailsCollectionViewCell.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class CarDetailsCollectionViewCell: UICollectionViewCell {

    
    static let reuseIdentifier = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    var cellViewModel:CarCollectionCellViewModel!{
        didSet{
            companyNameLabel.text = cellViewModel.companyName
            carModelLabel.text = cellViewModel.model
            availableLAbel.text = cellViewModel.availability
 
         }
    }

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var availableLAbel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
