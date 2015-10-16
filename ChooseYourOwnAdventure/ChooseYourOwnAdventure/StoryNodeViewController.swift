//
//  StoryNodeViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Charlie Depman on 10/1/15.
//  Copyright (c) 2015 Charlie Depman. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController {
    override func viewDidLoad() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: UIBarButtonItemStyle.Plain, target: self, action: "startOver")
        self.navigationItem.title = "Adventure!"
        
        super.viewDidLoad()
    }
    
    func startOver(){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
}
