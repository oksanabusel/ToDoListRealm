//
//  AddItemController.swift
//  RealmToDoList
//
//  Created by Cat on 3/16/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import UIKit

class AddItemController: UIViewController {
    
    @IBOutlet weak var taskNameTextfield: UITextField!
    @IBOutlet weak var taskDescription: UITextField!
    private var newTask: TaskObject?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapAddItemBtn(_ sender: Any) {
        newTask = TaskObject()
        
        newTask?.taskName = taskNameTextfield.text!
        newTask?.taskDescription = taskDescription.text!
        
        Storage.realm!.beginWrite()
        Storage.shared.realmRecords!.first?.taskList.append(newTask!)
        try! Storage.realm!.commitWrite()

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapCancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
