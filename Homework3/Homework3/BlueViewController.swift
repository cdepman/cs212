//
//  BlueViewController.swift
//  Homework3
//
//  Created by Jason on 1/25/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

class BlueViewController : UIViewController {
 
    // This is the method that is invoked when the button is pressed
    // in the blue view. We will discuss the @IBAction annotation
    // In the fourth lecture.
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Blue View Will Appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Blue View Did Appear!")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Blue View Will Disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Blue View Did Disappear")
    }
    
    @IBAction func returnToOrangeController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
