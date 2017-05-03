//
//  ViewController.swift
//  AutoLayoutSession
//
//  Created by Mohamed on 4/15/17.
//  Copyright © 2017 MET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardShow")), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardHide")), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
        
        
        
    }
    
    func keyboardShow(notification : NSNotification) {
        
    }
    func keyboardHide(notification : NSNotification) {
        
    }
    

    

   
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet var leftLabes: [UILabel]!
    @IBOutlet var rightLabels: [UILabel]!
    
    
    @IBOutlet weak var textF1: UITextField!
    @IBOutlet weak var textF2: UITextField!

    @IBAction func dublecatLeftBut(_ sender: UIBarButtonItem) {
        for theLabel in leftLabes{
        
        theLabel.text = theLabel.text! + " " + theLabel.text!
        
        }
        
        
    }
    
    @IBAction func dublicateRightBut(_ sender: UIBarButtonItem) {
        for theLabel in rightLabels{
            
            theLabel.text = theLabel.text! + " " + theLabel.text!
            
        }
        textF1.text = textF1.text! + " " + textF1.text!
        textF2.text = textF2.text! + " " + textF2.text!


    }


}

