//
//  CarTableViewCell.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
 
    static let reuseIdentifier = String(describing: CarTableViewCell.self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    var cellViewModel:CarCellCellViewModel!{
        didSet{
            modelName.text = cellViewModel.model
            availabilityLabel.text = cellViewModel.availability
         }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
}
