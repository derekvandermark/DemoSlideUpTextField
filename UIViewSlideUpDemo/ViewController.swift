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
    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var originalConstant: CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        self.originalConstant = bottomConstraint.constant
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            sampleTextField.endEditing(true)
        }
    }
    
    
}

extension ViewController {
   
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            self.bottomConstraint.constant += keyboardSize.height + 5
            
            UIView.animate(withDuration: 0.5, animations: {

                self.view.layoutIfNeeded()

            })
        }
    }

    @objc func keyboardWillHide(notification: NSNotification){
        print("keyboardWillHide")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            self.bottomConstraint.constant = self.originalConstant
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.view.layoutIfNeeded()
                
            })
        }
        
    }

}
