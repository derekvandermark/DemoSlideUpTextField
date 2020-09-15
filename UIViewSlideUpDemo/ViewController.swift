//
//  ViewController.swift
//  UIViewSlideUpDemo
//
//  Created by Derek Vandermark on 9/14/20.
//  Copyright © 2020 Derek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sampleView: UIView!
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var smapleTextfield: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        
        let radiusViewConstraint = NSLayoutConstraint(item: sampleView!, attribute: .bottom, relatedBy: .equal, toItem: super.view, attribute: .bottom, multiplier: 1.0, constant: -30.0)
        
        view.addConstraint(radiusViewConstraint)
        print(view.constraints)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            smapleTextfield.endEditing(true)
        }
    }
    
    
}

extension ViewController {
   
   @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
       if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
           
           self.sampleView.center.y += (-1 * keyboardSize.height)
           view.constraints[2].constant += (-1 * keyboardSize.height)
       
       UIView.animate(withDuration: 0.5, animations: {

            self.view.layoutIfNeeded()

        })
       }
   }

      @objc func keyboardWillHide(notification: NSNotification){
        print("keyboardWillHide")
       if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {

           self.sampleView.center.y += 1 * keyboardSize.height
           view.constraints[2].constant -= (-1 * keyboardSize.height)

        UIView.animate(withDuration: 0.5, animations: {

            self.view.layoutIfNeeded()

        })
       }
   
   }

}
