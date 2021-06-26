//
//  WelcomeViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    setData()
    }
    
    func setData(){
        welcomeNameLabel.text = "Welcome \(User.shared?.userName ?? "")"
    }
 
}
