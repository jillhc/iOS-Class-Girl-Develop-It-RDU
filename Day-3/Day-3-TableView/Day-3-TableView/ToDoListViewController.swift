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
    let detailSegueIdentifier = "detail"

    
//MARK: View lifecycle & Navigation
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        // Set the tableviews' delegate and data source to this instance of ToDoListViewController
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.editing = editing
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == detailSegueIdentifier {
            let destination = segue.destinationViewController as! DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let toDoItem = self.toDoItems[indexPath.row]
                destination.toDoItem = toDoItem

                // Deselect the cell, so when the user returns it's not still gray
                // Try commenting this line out and see the difference
                self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }


//MARK: Actions
    @IBAction func addToDoItem() {
        let newToDoItem = ToDoItem()
        newToDoItem.title = toDoItemTextField.text
        newToDoItem.dateCreated = NSDate()

        self.toDoItems.append(newToDoItem)
        self.toDoItemTextField.text = ""

        self.tableView.reloadData()
    }


//MARK: TableView Data Source & Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(toDoCellIdentifier) as! UITableViewCell

        let toDoItem = self.toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItem.title
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.toDoItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

}
