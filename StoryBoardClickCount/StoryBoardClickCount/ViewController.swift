//
//  ViewController.swift
//  StoryBoardClickCount
//
//  Created by Charlie Depman on 9/10/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    @IBOutlet weak var addTenButton: UIButton!
    @IBOutlet weak var addOneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func incrementCountByOne () {
        count++
        updateCount()
    }
    
    @IBAction func incrementCountByTen () {
        count += 10
        updateCount()
    }
    
    @IBAction func resetCount () {
        count = 0
        updateCount()
    }
    
    @IBAction func decrementByThree () {
        count -= 3
        updateCount()
    }
    
    @IBAction func setAsRandomNumber () {
        count = random() / 10000
        updateCount()
    }
    
    @IBAction func changeCount(sender: UIButton){
        if sender.currentTitle == "+10" {
            count += 10
        } else if sender.currentTitle == "+1" {
            count += 1
        }
        updateCount()
    }
    
    func updateCount(){
        label.text = "\(count)"
    }
}

