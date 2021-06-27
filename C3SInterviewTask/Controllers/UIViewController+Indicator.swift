//
//  Indicator.swift
//
//
//  Created by AnDy on 8/25/19.
//  Copyright © 2019 Ibrahim. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showHUD(_ message:String = "Loading"){
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.contentMode = .center
        progressHUD.label.text = message
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showMessage(_ message:String , time:Double = 2.0 ){
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.contentMode = .center
        progressHUD.label.text = message
        progressHUD.label.numberOfLines = 0
        progressHUD.mode = .text
        
        run(after: time) {
            UIView.animate(withDuration: 0.6, animations: {
                progressHUD.alpha = 0
            }, completion: { (success) in
                progressHUD.hide(animated: true)
             })

     }
        
         
 
    
    }
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }

}
