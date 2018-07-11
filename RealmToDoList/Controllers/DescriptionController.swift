//
//  DescriptionController.swift
//  RealmToDoList
//
//  Created by Cat on 3/16/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import UIKit

class DescriptionController: UIViewController {
    
    var name: String = ""
    var desc: String = ""
    var dateCreated: String = ""
    var taskObject: TaskObject?
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDateLabel: UILabel!
    @IBOutlet weak var taskDescription: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameLabel.text = name
        taskDateLabel.text = dateCreated
        taskDescription.text = desc
    }
    
    @IBAction func tapCompleteBtn(_ sender: Any) {
        Storage.realm!.beginWrite()
        taskObject?.isCompleted = true
        Storage.realm!.add(taskObject!)
        try! Storage.realm!.commitWrite()
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapInProgressBtn(_ sender: Any) {
        Storage.realm!.beginWrite()
        taskObject?.isCompleted = false
        Storage.realm!.add(taskObject!)
        try! Storage.realm!.commitWrite()
        
        navigationController?.popViewController(animated: true)
    }
}
