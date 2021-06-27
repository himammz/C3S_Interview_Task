//
//  RentDateViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import UIKit

class RentDateViewController: UIViewController {


    
    static var instance:RentDateViewController{
        let vc =  UIStoryboard(name: "Car", bundle: nil).instantiateViewController(withIdentifier: "rentDateViewController") as! RentDateViewController
         return vc

    }

    @IBOutlet weak var numberofDaysTextField: UITextField!
    
    var viewModel:RentViewModel!
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDateChanged(pickerDate)
    }
    
    
    
    @IBAction func saveAction(){
        viewModel.numberOfDays =  Int(numberofDaysTextField.text ?? "" ) ?? 0
        viewModel.storeRecord()
        dismiss(animated: true, completion: nil)

    }
 
    @IBAction func pickerDateChanged(_ sender: UIDatePicker) {
        viewModel.currentDate = sender.date
     }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        if touch?.view == view{
            dismiss(animated: true, completion: nil)
        }
    }
    

    
}
