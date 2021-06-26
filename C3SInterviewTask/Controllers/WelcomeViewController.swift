//
//  WelcomeViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 26/06/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    static var instance:WelcomeViewController{
        
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeViewController") as! WelcomeViewController
         return vc

    }
    let loadintTime:Double = 3.0


    @IBOutlet weak var welcomeNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         DispatchQueue.main.asyncAfter(deadline: .now() + loadintTime ) { [weak self] in
             self?.showNextScreen()
        }

    }
    func setData(){
        welcomeNameLabel.text = "Welcome \(User.shared?.userName ?? "")"
    }
    func showNextScreen(){
        let homeNavigation = HomeCollectionViewController.Navigationinstance
        
        AppDelegate.rootViewController = homeNavigation
    }
 
}
