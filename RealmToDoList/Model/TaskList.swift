//
//  TaskList.swift
//  RealmToDoList
//
//  Created by Cat on 3/16/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import RealmSwift
import Foundation

class TaskList: Object {
    var taskList = List<TaskObject>()
}
