//
//  DetailViewController.swift
//  Day-3-TableView
//
//  Created by Jill Cohen on 7/20/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    var toDoItem = ToDoItem()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!


    override func viewDidLoad() {
        // Call super first, as required
        super.viewDidLoad()

        // Set title for navigation bar
        self.navigationItem.title = self.toDoItem.title + ": Detail"

        // Configure labels
        self.titleLabel.text = self.toDoItem.title
        if self.toDoItem.note != nil {
            self.noteLabel.text = self.toDoItem.note
            self.noteLabel.textColor = UIColor.blackColor()
        } else {
            self.noteLabel.text = "(none)"
            self.noteLabel.textColor = UIColor.grayColor()
        }

        // Use a date formatter to convert the date to a string
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        self.dateCreatedLabel.text = dateFormatter.stringFromDate(self.toDoItem.dateCreated)
    }
}
