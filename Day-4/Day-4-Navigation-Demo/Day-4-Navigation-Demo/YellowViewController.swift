//
//  YellowViewController.swift
//  Day-4-Navigation-Demo
//
//  Created by Ticketmaster Mobile Studio on 7/28/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    var event = String()

    @IBOutlet weak var eventNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        eventNameLabel.text = event
    }
}

// tableView.indexPathForSelectedRow()



