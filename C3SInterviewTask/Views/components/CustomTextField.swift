//
//  CustomTextField.swift
//  C3SInterviewTask
//
//  Created by Ibrahim on 25/06/2021.
//

import UIKit
@IBDesignable

class CustomTextField: UITextField {

 
 
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
 
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.borderStyle = .none
        
        self.layer.cornerRadius = 20

        addPadding()
 
    }
 
    func addPadding(){
        let paddingView =  UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        if leftView == nil{
            self.leftView = paddingView
            self.leftViewMode = .always

         }
        if rightView == nil{
            self.rightView = paddingView
            self.rightViewMode = .always

         }

    }
}
