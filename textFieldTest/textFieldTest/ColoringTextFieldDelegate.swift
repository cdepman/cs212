//
//  ColoringTextFieldDelegate.swift
//  textFieldTest
//
//  Created by Charlie Depman on 9/17/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class ColoringTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var backgroundColor: UIColor = UIColor.whiteColor()
    
    let colors = [
        "red" : UIColor.redColor(),
        "yellow" : UIColor.yellowColor(),
        "blue" : UIColor.blueColor(),
        "green": UIColor.greenColor(),
        "gray" : UIColor.grayColor(),
    ]
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        println(textField.text)
        
        let newString = (textField.text as NSString).stringByReplacingCharactersInRange(range,withString: string)
        
        for (colorName, color) in colors {
            if newString.rangeOfString(colorName) != nil {
                backgroundColor = color
            }
        }
        
        if let color = colors[textField.text] {
            backgroundColor = color
        }
//      let newString = textField.text.stringByReplacingCharactersInRange()
        
        return true
    }
}
