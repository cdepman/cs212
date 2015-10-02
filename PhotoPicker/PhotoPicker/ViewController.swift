//
//  ViewController.swift
//  PhotoPicker
//
//  Created by Charlie Depman on 9/24/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pickerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let test = segue.destinationViewController as! TestModalViewController
        switch segue.identifier! {
            case "PresentTest":
                test.labelText = "Named Segue Technique"
            case "Triggered":
                test.labelText = "Triggered Segue Technique"
            default:
                assert(false)
        }
        
    }
    
    @IBAction func presentTestUsingAllCode(){
        let test = storyboard!.instantiateViewControllerWithIdentifier("TestViewController") as! TestModalViewController
        presentViewController(test, animated: true, completion: nil)
        test.techniqueLabel.text = "ALL CODE"
    }
    
    @IBAction func presentTestUsingNamedSegue(){
        performSegueWithIdentifier("PresentTest", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

