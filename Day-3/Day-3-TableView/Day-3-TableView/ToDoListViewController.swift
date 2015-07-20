//
//  ToDoListViewController.swift
//  Day-3-TableView
//
//  Created by Jill Cohen on 7/19/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var toDoItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var toDoItems = [String]()
    let toDoCellIdentifier = "toDoCellIdentifier"

    
//MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the tableviews' delegate and data source to this instance of ToDoListViewController

    }


//MARK: Actions
    @IBAction func addToDoItem() {
        let newItem = toDoItemTextField.text
        toDoItems.append(newItem)
        toDoItemTextField.text = ""
    }


//MARK: TableView Data Source & Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    }

}
