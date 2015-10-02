//
//  ViewController.swift
//  TextFieldDelegates
//
//  Created by Charlie Depman on 9/21/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

extension String {
    func insert(string:String,idx:Int) -> String {
        return  prefix(self,idx) + string + suffix(self,count(self)-idx)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var limitedEntryField: UITextField!
    @IBOutlet var moneyField: UITextField!
    @IBOutlet var funField: UITextField!
    @IBOutlet var moneyFieldEditableSwitch: UISwitch!
    var moneyEditable: Bool = true
    var sum: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        limitedEntryField.delegate = self
        moneyField.delegate = self
        funField.delegate = self
        funField.textColor = UIColor.yellowColor()
        moneyField.text = "$0.00"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case limitedEntryField:
            return handleLimitedEntryField(string, textField: textField)
        case moneyField:
            return handleMoneyField(textField, range: range, nextNum: string)
        case funField:
            return true
        default:
            return false
        }
    }
    
    @IBAction func switchWasFlipped(switchState : UISwitch){
        moneyEditable = switchState.on
    }
    
    func handleLimitedEntryField(candidate: String, textField: UITextField) -> Bool {
        if candidate != "" && count(textField.text) >= 5 {
            return false
        }
        return true
    }
    
    func handleMoneyField(textField: UITextField, range: NSRange, nextNum: String) -> Bool {
        if moneyEditable {
            if let r = nextNum.toInt() {
                sum += nextNum
                textField.text = buildSumString()
                return false
            } else if (nextNum == "" && count(sum) > 0) {
                sum = dropLast(sum)
                textField.text = buildSumString()
                return false
            } else {
              return false
            }
        }
        return false
    }
    
    func buildSumString() -> String {
        
        var adjusted: String = ""
        
        switch count(sum) {
        case 0:
            adjusted = "0.00"
        case 1:
            adjusted = "0.0" + sum
        case 2:
            adjusted = "0." + sum
        default:
            var index = count(sum) - 2
            adjusted = sum.insert(".", idx: index)
        }
        
        if count(adjusted) > 6 {
            adjusted = addCommasToSum(adjusted)
        }
        
        return "$" + adjusted
    }
    
    func addCommasToSum(sum: String) -> String{
        var withCommas = sum
        for idx in 4..<count(sum){
            if idx % 3 == 0 {
                withCommas = withCommas.insert(",", idx: count(sum) - idx)
            }
        }
        return withCommas
    }

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }


}

