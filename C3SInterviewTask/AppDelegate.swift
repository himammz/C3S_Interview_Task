//
//  AppDelegate.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared().isEnabled = true

        return true
    }

 

}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static var rootViewController:UIViewController?{
        get{
            return AppDelegate.shared.window?.rootViewController

        }
        set{
            AppDelegate.shared.window?.rootViewController = newValue
        }
    }
    
}
