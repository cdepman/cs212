//
//  ViewController.swift
//  Calculator
//
//  Created by Charlie Depman on 9/12/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var total: Int = 0
    var temp: Int = 0
    var lastOperation: UIButton!
    
    var operations = [UIButton: Bool]()
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var equalsButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operations[addButton] = true
    }
    
    @IBAction func clear () {
        total = 0
        displayTotal()
    }
    
    @IBAction func buttonPressed(button: UIButton) {
        if let operation = operations[button] {
            lastOperation = button
        } else {
            lastOperation = equalsButton
        }
        switch button {
        case addButton:
            if let lastOperation = addButton {
                displayTotal()
            } else {
                total = total + temp
            }
        case equalsButton:
            if lastOperation != equalsButton {
                buttonPressed(lastOperation)
            } else {
                total = temp
                displayTotal()
            }
        case oneButton:
            temp = 1
            displayTemp()
        case twoButton:
            temp = 2
            displayTemp()
        default:
            displayTotal()
        }
    }
    
    func displayTotal() {
        totalLabel.text = "\(total)"
    }
    
    func displayTemp() {
        totalLabel.text = "\(temp)"
    }

}

