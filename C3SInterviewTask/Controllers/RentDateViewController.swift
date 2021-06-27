//
//  RentDateViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 27/06/2021.
//

import UIKit

class RentDateViewController: UIViewController {

    
    @IBOutlet weak var numberofDaysTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     }
    
    
    
    @IBAction func saveAction(){
        
    }
 
    @IBAction func pickerDateChanged(_ sender: UIDatePicker) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        if touch?.view == view{
            dismiss(animated: true, completion: nil)
        }
    }
}
