//
//  Tasks.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/18/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

class Task {
    //This is the class for the tasks that the user will be entering into their list of tasks to do. It will be taking in the data presented by the user and creating a task out of it as shown below.
    var title: String
    var detailsOfTask: String
    var completionStatus: Bool = false
    var completionDate: Date?
    
    init(title: String, detailsOfTask: String) {
        self.title = title
        self.detailsOfTask = detailsOfTask
    }
}
