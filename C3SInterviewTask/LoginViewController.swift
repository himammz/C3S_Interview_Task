//
//  LoginViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUi()
    }

 
    
    
    
    func setupUi(){
        
        continueButton.layer.cornerRadius = 20
 
    }
}
