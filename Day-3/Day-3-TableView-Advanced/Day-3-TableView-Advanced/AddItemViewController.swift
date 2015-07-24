//
//  AddItemViewController.swift
//  Day-3-TableView
//
//  Created by Jill Cohen on 7/20/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func addItemViewControllerDidFinish(newToDoItem: ToDoItem)
}


class AddItemViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!

    var delegate: AddItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func done(sender: AnyObject) {
        if let delegate = self.delegate {
            let newToDoItem = ToDoItem()
            newToDoItem.title = titleTextField.text
            newToDoItem.dateCreated = NSDate()
            if noteTextField.text != "" {
                newToDoItem.note = noteTextField.text
            }
            // else, remains nil

            delegate.addItemViewControllerDidFinish(newToDoItem)
        }
    }
}
