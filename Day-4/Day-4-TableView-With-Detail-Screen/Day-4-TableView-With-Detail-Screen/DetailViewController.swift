//
//  DetailViewController.swift
//  Day-4-TableView-With-Detail-Screen
//
//  Created by Jill Cohen on 7/31/15.
//  Copyright (c) 2015 Jill Cohen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var toDoItem = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.toDoItem
    }
}
