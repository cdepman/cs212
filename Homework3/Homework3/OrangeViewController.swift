//
//  OrangeViewController.swift
//  Homework3
//
//  Created by Jason on 1/25/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

class OrangeViewController : UIViewController {
    
    var orangeCount = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Orange View Will Appear!")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        orangeCount++
        println("Orange View Did Appear \(orangeCount) time(s)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Orange View Will Disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Orange View Did Disappear")
    }
}
