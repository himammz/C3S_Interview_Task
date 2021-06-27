//
//  CarCompanyTableViewCell.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import UIKit

class CarCompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var numberOfCarsLabel: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    
    static let reuseIdentifier =  String(describing: CarCompanyTableViewCell.self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    var cellViewModel:CompanySectionViewModel!{
        didSet{
            companyName.text = cellViewModel.companyName
            numberOfCarsLabel.text = "\(cellViewModel.numberOfItems) cars"
            companyImage.kf.indicatorType = .activity
            companyImage.kf.setImage(with: cellViewModel.logoURL)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        companyImage.layer.cornerRadius = companyImage.frame.width / 2
        
    }
    
    
    
    

 
}
