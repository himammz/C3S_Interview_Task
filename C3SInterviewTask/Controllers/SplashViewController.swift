//
//  SplashViewController.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

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
            
        }
    }
    

}

