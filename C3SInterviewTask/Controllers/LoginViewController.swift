//
//  LoginViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit
import SwiftKeychainWrapper
class LoginViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    
    static var instance:LoginViewController{
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
         return vc

    }

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
    
    
    
    
    @IBAction func continueAction(_ sender: Any) {
         guard  isValidUserName() else {
            return
        }
        saveUser()
        showNextScreen()
    }
    
    
    
    // MARK- Validation
    func isValidUserName () -> Bool {
        let format = "SELF MATCHES %@"
        let regx = "[A-Z0-9a-z\\u0621-\\u064A]{1,30}"
        let text = userNameTextField.text ?? ""
        return NSPredicate(format: format, regx).evaluate(with: text)
    }
    
    func saveUser(){
        let text = userNameTextField.text ?? ""
         User.shared = User(userName: text)
    }
    
    func showNextScreen(){
        let welcomeViewController = WelcomeViewController.instance
        AppDelegate.rootViewController = welcomeViewController

    }
 
 

}



