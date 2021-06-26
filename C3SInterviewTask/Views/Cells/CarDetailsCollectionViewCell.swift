//
//  CarDetailsCollectionViewCell.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit
import Kingfisher
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
            carImageView.kf.indicatorType = .activity
            carImageView.kf.setImage(with: cellViewModel.imageURL )
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
