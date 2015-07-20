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

    var toDoItems = [ToDoItem]()
    let toDoCellIdentifier = "toDoCellIdentifier"

    
//MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        // Set the tableviews' delegate and data source to this instance of ToDoListViewController
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }

//MARK: Actions
    @IBAction func addToDoItem() {
        let newToDoItem = ToDoItem()
        newToDoItem.title = toDoItemTextField.text
        newToDoItem.dateCreated = NSDate()

        toDoItems.append(newToDoItem)
        toDoItemTextField.text = ""

        tableView.reloadData()
    }


//MARK: TableView Data Source & Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(toDoCellIdentifier) as! UITableViewCell

        let toDoItem = toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItem.title
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

}
