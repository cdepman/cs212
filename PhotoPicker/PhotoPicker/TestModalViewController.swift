//
//  TestModalViewController.swift
//  PhotoPicker
//
//  Created by Charlie Depman on 9/24/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class TestModalViewController: UIViewController {
    
    @IBOutlet var techniqueLabel: UILabel!
    var labelText: String = "None"

    override func viewDidLoad() {
        super.viewDidLoad()
        techniqueLabel.text = labelText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissSelf (){
        dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
