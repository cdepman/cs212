//
//  MatchResult.swift
//  Rock Paper Scissors
//
//  Created by Charlie Depman on 10/6/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class MatchResult: UIViewController {
    var resultText: String = ""
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hideSelf(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
