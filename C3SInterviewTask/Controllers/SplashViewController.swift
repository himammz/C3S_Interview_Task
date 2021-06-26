//
//  SplashViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit
import SwiftKeychainWrapper
class SplashViewController: UIViewController {

    @IBOutlet weak var loadingIndecator: UIActivityIndicatorView!
    
    let loadintTime:Double = 3.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearUserIfFreshInstall()
        User.load()
        print (JsonReader().readLocalJSONFile(forName: "CarCategories"))
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingIndecator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + loadintTime ) { [weak self] in
            self?.loadingIndecator.stopAnimating()
            self?.showNextScreen()
        }
    
    }
    


}

extension SplashViewController{
    
    
    func showNextScreen(){
        var nextViewController:UIViewController!
        if let _ = User.shared  {
              nextViewController = WelcomeViewController.instance
        }else {
              nextViewController = LoginViewController.instance
        }

        AppDelegate.rootViewController = nextViewController
        
    }
    
    func clearUserIfFreshInstall(){
        let userDef  = UserDefaults.standard
        if  userDef.value(forKey: "opendBefore") == nil {
            User.remove()
        }

        userDef.set(true, forKey: "opendBefore")

    }
    
 

}
