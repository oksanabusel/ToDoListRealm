//
//  ToDoCell.swift
//  RealmToDoList
//
//  Created by Cat on 3/16/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    private var isCompleted: Bool = true
    
    func setData(_ data: TaskObject) {
        self.taskNameLabel.text = data.taskName
        checkImage.isHidden = !data.isCompleted
    }
}
