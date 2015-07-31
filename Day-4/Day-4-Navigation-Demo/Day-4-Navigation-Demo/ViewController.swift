//
//  ViewController.swift
//  Day-4-Navigation-Demo
//
//  Created by Ticketmaster Mobile Studio on 7/28/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

// Purple

class ViewController: UIViewController {

    var event = "Taylor Swift Concert!"
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "purpleToYellowSegue" {
            let yellowViewController = segue.destinationViewController as! YellowViewController
            
            yellowViewController.event = event
        }
    }

}

