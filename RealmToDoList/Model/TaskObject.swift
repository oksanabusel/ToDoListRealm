//
//  TaskObject.swift
//  RealmToDoList
//
//  Created by Cat on 3/16/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import RealmSwift
import Foundation

class TaskObject: Object {
    @objc dynamic var taskName: String = ""
    @objc dynamic var taskCreatedData = NSDate()
    @objc dynamic var taskDescription: String = ""
    @objc dynamic var isCompleted: Bool = false

}
