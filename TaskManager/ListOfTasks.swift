//
//  ListOfTasks.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/18/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

class ListOfTasks {
    var taskArray : [Task] = [Task(title: "Do laundry", detailsOfTask: "Wash whites and towels before 12:00 PM."), Task(title: "Clean bathroom", detailsOfTask: "Clean toilet bowl and mop floor before changing load of laundry"), Task(title: "Go grocery shopping", detailsOfTask: "Pick up milk, some snacks, and eggs."), Task(title: "Call for info on electric bill", detailsOfTask: "Call electric company on when next bill is due.")]
    
    func CreateTask() {
        print("Adding a new task to your day?? Very well enter your new task.")
        var newTaskName = readLine()
        while newTaskName == nil || newTaskName == "" {
            print("Oops! Invalid name, please enter a valid name for your task.")
            newTaskName = readLine()
        }
        print("Please enter the description of your new task.")
        var newTaskDescription = readLine()
        while newTaskDescription == nil || newTaskDescription == "" {
            print("Oops! Invalid description, please enter a valid description for your task.")
            newTaskDescription = readLine()
        }
        let newTask = Task(title: newTaskName!, detailsOfTask: newTaskDescription!)
        taskArray.append(newTask)
    }
    
}
