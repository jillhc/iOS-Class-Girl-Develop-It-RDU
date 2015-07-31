//
//  ViewController.swift
//  Day-4-Delegate-Demo
//
//  Created by Jill Cohen on 7/24/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var counterLabel: UILabel!
    var count: Int = 0


    @IBAction func showAlert() {
        let alertView = UIAlertView()
        alertView.title = "Increase Counter"
        alertView.message = "How many should we add to the counter?"
        alertView.addButtonWithTitle("1")
        alertView.addButtonWithTitle("2")

        alertView.delegate = self

        alertView.show()
    }


    func increaseCounterBy(count: Int) {
        self.count += count
        self.counterLabel.text = "\(self.count)"
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 0:
            increaseCounterBy(1)
        case 1:
            increaseCounterBy(2)
        default:
            break
        }
    }
}


