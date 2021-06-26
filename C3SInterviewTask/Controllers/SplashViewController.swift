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
        // Do any additional setup after loading the view.
 
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
        User.load()
        guard let _ = User.shared else {
            let loginViewController = LoginViewController.instance
            AppDelegate.shared.window?.rootViewController = loginViewController
            return
        }

        let homeNAvigationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeNavigationViewController")

                AppDelegate.shared.window?.rootViewController = homeNAvigationViewController


        
    }
    
    
 

}
