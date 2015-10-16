//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Charlie Depman on 10/6/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var outcome: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultView = segue.destinationViewController as! MatchResult
        switch segue.identifier! {
        case "PlayPaper":
            playRound(RPS.Paper)
            resultView.resultText = outcome
        case "PlayScissors":
            playRound(RPS.Scissors)
            resultView.resultText = outcome
        default:
            assert(false)
        }
    }
    
    enum RPS {
        case Rock, Scissors, Paper
    }
    
    @IBAction func presentRPSResult(){
        playRound(RPS.Rock)
        let resultView = storyboard!.instantiateViewControllerWithIdentifier("MatchResult") as! MatchResult
        resultView.resultText = outcome
        presentViewController(resultView, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(){
        performSegueWithIdentifier("PlayPaper", sender: self)
    }
    
    func playRound(play: RPS){
        let playerChoice = play
        let computerChoice = getComputerPlay()
        if playerChoice == computerChoice {
            outcome = "TIE!"
        } else {
            switch (playerChoice, computerChoice){
            case (.Rock, .Scissors):
                outcome = "Rock vs. Scissors: You Win!"
            case (.Rock, .Paper):
                outcome = "Rock vs. Paper: You Lose."
            case (.Paper, .Rock):
                outcome = "Paper vs. Rock: You Win!"
            case (.Paper, .Scissors):
                outcome = "Paper vs. Scissors: You Lose."
            case (.Scissors, .Rock):
                outcome = "Scissors vs. Rock: You Lose."
            case (.Scissors, .Paper):
                outcome = "Scissors vs. Paper: You Win!"
            default:
                outcome = "Something is Broken :<"
            }
        }
        
    }
    
    func getComputerPlay() -> RPS {
        var computerChoice = RPS.Paper
        let computerPlay = Int(arc4random_uniform(3) + 1)
        switch computerPlay {
        case 1:
            computerChoice = .Paper
        case 2:
            computerChoice = .Rock
        case 3:
            computerChoice = .Scissors
        default:
            computerChoice = .Rock
        }
        return computerChoice
    }

}

