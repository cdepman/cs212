//
//  ViewController.swift
//  Roshambo
//
//  Created by Jason Schatz on 9/28/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MoveSelectionController: UIViewController {
    
    // Rock: The 'hard' way, all in code. No Storyboard Segue
    // Notice that the RPS property on the MatchResultViewController can be set directly
    
    @IBAction func crushWithRock(sender: UIButton) {
        // Instantiate the MatchResutsViewController using the storyboard property
        let object: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("MatchResultViewController")
        let controller = object as! MatchResultViewController
        // Set the player1 property to .Rock
        controller.player1 = .Rock
        
        // Push the MatchesultsViewController onto the navigation stack, using the navigationController property
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    // Scissors: The middle way. A Storyboard Segue triggered manually in an IBAction
    
    @IBAction func cutWithScissors(sender: UIButton) {
        // invoke performSegueWithIdentifier using the identifier "CutWithScissors"
        performSegueWithIdentifier("CutWithScissors", sender: self)
    }
    
    // Paper: The 'easy' way. A Storyboard Segue triggered directly by a control.
    
    // The following method is important for both Scissors and Paper. It looks at the Segueue
    // identifier and sets the right RPS move in the destination controller. 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let controller = segue.destinationViewController as! MatchResultViewController
        
        if segue.identifier == "CutWithScissors" {
            controller.player1 = .Scissors
        } else if segue.identifier == "CoverWithPaper" {
            controller.player1 = .Paper
        } else {
            assert(false, "unrecognized segue: \(segue.identifier)")
        }
        // Get the MatchResutsViewController using the seque's destinationViewController property
        // Set the controller's player1 using the segue identifiers "CutWithScissors" and "CoverWithPaper"
    }
}

