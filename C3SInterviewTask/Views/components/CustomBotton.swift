//
//  CustomBotton.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit

@IBDesignable
class CustomBotton: UIButton {

    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

    
       @IBInspectable var borderWidth:CGFloat = 0{
           didSet{
               self.layer.borderWidth = borderWidth
           }
       }
       @IBInspectable var borderColor:UIColor = UIColor.black  {
           didSet{
               self.layer.borderColor = borderColor.cgColor
           }
       }
       
       @IBInspectable var shadowOpacity:CGFloat = 0.0{
           didSet{
               self.layer.shadowOpacity = Float(shadowOpacity)
           }
       }
       @IBInspectable var shadowColor:UIColor = UIColor.clear  {
           didSet{
               self.layer.shadowColor = shadowColor.cgColor
           }
       }
       
       @IBInspectable var shadowRadius:CGFloat = 0{
           didSet{
               self.layer.shadowRadius = shadowRadius
           }
       }
       
       @IBInspectable var shadowOffsetY:CGFloat = 0{
           didSet{
               self.layer.shadowOffset.height = shadowOffsetY
           }
       }
    

}
