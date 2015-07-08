//
//  ViewController.swift
//  My First Swift App
//
//  Created by Ticketmaster Mobile Studio on 7/7/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Access or change a label's text using [nameOfVariable].text
        greetingLabel.text = "hello"
    }
    
    
    @IBAction func flipGreeting() {
        // Currently, this changes the greeting once to "goodbye"

        greetingLabel.text = "goodbye"

        // Take home exercise:
        // Tapping the button flips the greeting between "hello" and "goodbye"
    }

}

