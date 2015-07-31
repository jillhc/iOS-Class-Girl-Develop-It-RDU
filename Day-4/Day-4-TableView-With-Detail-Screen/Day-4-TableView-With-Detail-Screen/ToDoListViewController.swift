//
//  ToDoListViewController.swift
//  Day-4-TableView-With-Detail-Screen
//
//  Created by Jill Cohen on 7/26/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var toDoItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var toDoItems = [String]()
    let toDoCellIdentifier = "toDoCellIdentifier"
    let listToDetailSegueIdentifier = "listToDetailSegue"

    //MARK: View lifecycle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // If a cell is selected, deselect it
        let indexPath = self.tableView.indexPathForSelectedRow()
        if indexPath != nil {
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the tableview's delegate and data source to this instance of ToDoListViewController
        tableView.dataSource = self
        tableView.delegate = self
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Check which segue is occurring
        if segue.identifier == self.listToDetailSegueIdentifier {
            // Cast the destination view controller as a DetailViewController
            // so that its unique properties can be accessed
            let destination = segue.destinationViewController as! DetailViewController

            // Get the location of the selected row
            // This returns an optional, because it would return nil if no row is selected
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            // Even though we can be sure that "selectedIndexPath" has a value, since this segue is only
            // triggered by row selection, still check for safety before force unwrapping
            if selectedIndexPath != nil {
                let selectedRow = selectedIndexPath!.row
                let toDoItem = self.toDoItems[selectedRow]
                destination.toDoItem = toDoItem
            }
        }
    }


    //MARK: Actions
    @IBAction func addToDoItem() {
        let newItem = toDoItemTextField.text
        toDoItems.append(newItem)
        toDoItemTextField.text = ""

        tableView.reloadData()
    }


    //MARK: TableView Data Source & Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(toDoCellIdentifier) as! UITableViewCell
        let toDoItemName = toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItemName
        return cell
    }
    
}
