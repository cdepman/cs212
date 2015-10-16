//
//  ViewController.swift
//  TableTest
//
//  Created by Charlie Depman on 10/8/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
//    let animalNames = ["Racoon", "Goose", "Elephant", "Penguin", "Coyote", "Manatee", "Squirrel", "Bumblebee"]
    
    struct Keys {
        static let Name = "Name"
        static let Description = "Description"
        static let Color = "Color"
    }
    
    func makeUILabel(labelText: String) -> UILabel {
        var newLabel = UILabel()
        newLabel.text = labelText
        return newLabel
    }
    
    var colorDictionaries: [[String : AnyObject]] = [
        [   Keys.Name : "Red",
            Keys.Description : "fierce",
            Keys.Color : UIColor.redColor()
        ],
        [   Keys.Name : "Blue",
            Keys.Description : "cool",
            Keys.Color : UIColor.blueColor()
        ],
        [   Keys.Name : "Green",
            Keys.Description : "organic",
            Keys.Color : UIColor.greenColor()
        ],
        [   Keys.Name : "Orange",
            Keys.Description : "bright",
            Keys.Color : UIColor.orangeColor()
        ],
        [   Keys.Name : "Purple",
            Keys.Description : "happy",
            Keys.Color : UIColor.purpleColor()
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get a cell object from the table
        let cell = tableView.dequeueReusableCellWithIdentifier("MyFirstCell") as! UITableViewCell
        let dictionary = colorDictionaries[indexPath.row]
        
        // decorate the cell
        cell.textLabel!.text = dictionary[Keys.Name] as? String
        cell.detailTextLabel!.text = dictionary[Keys.Description] as? String
        cell.backgroundColor = dictionary[Keys.Color] as? UIColor
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // return the cell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorDictionaries.count
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("ROW \(indexPath.row) SELECTED!")
        colorDictionaries.removeAtIndex(indexPath.row)
//        tableView.reloadData()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
    }
    
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

