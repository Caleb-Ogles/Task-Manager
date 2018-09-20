//
//  ListOfTasks.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/18/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

class ListOfTasks {
    var taskArray : [Task] = []
    
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
        let currentCalendar = Calendar.current
        let completionDate = currentCalendar.date(byAdding: .hour, value: 4, to: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, h"
        print("You told me to tell you that this task is to be completed on \(dateFormatter.string(from: completionDate!)) hours from now.")
        taskArray.append(newTask)
    }
    
    func removeTask() {
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].title)")
        }
        print("No longer need a task?? Alrighty then, please enter the task you want to remove.")
        
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<taskArray.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Oops! Invalid option. Please enter a valid option.")
            userInput = Int(readLine()!)
        }
        taskArray.remove(at: userInput!)
        
    }
    
    func listOfAllTasks() {
        for task in taskArray {
            print("\(task.title), Description: \(task.detailsOfTask)")
        }
    }
    
    func listOfAllCompletedTasks() {
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == true {
                print("\(index). \(taskArray[index].title), Description: \(taskArray[index].detailsOfTask)")
            }
        }
    }
    
    func listOfAllUncompletedTasks() {
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == false {
                print("\(index). \(taskArray[index].title), \(taskArray[index].detailsOfTask)")
            }
        }
    }
    
    func listTaskAsComplete() {
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == false {
                print("\(index). \(taskArray[index].title)")
            }
        }
        print("Ooooo you completed a task! Congrats on being productive! Please select the task you would like to mark as complete.")
        
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Oops! Invalid selection. Please select a valid option.")
            userInput = Int(readLine()!)
        }
        
        taskArray[userInput!].completionStatus = true
        taskArray[userInput!].completionDate = nil
        
    }
    
    func listTaskAsUncomplete() {
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == true {
                print("\(index). \(taskArray[index].title)")
            }
        }
        print("Well I guess one uncomplete task wont hurt a bit would it? Please select the task that was completed that you would then like to mark as uncomplete.")
        
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Oops! Invalid selection. Please enter a valid option.")
            userInput = Int(readLine()!)
        }
        
        taskArray[userInput!].completionStatus = false
        
    }
    
    func editTask() {
        print("So you want to edit a task huh? Very well. Please enter the index of the task you wish to edit")
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].title), Description: \(taskArray[index].detailsOfTask)")
        }
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Oops! Invalid selection. Please enter a valid option.")
            userInput = Int(readLine()!)
        }
        print("Please enter a new title for your pre-existing task.")
        var editedTaskName = readLine()
        while editedTaskName == nil || editedTaskName == "" {
            print("Oops! Invalid selection. Please enter a valid option.")
            editedTaskName = readLine()
        }
        print("Please enter a new description for your pre-existing task.")
        var editedTaskDesc = readLine()
        while editedTaskName == nil || editedTaskName == "" {
            print("Oops! Invalid selection. Please enter a valid option.")
            editedTaskDesc = readLine()
        }
        let editedTask = Task(title: editedTaskName!, detailsOfTask: editedTaskDesc!)
        
        let currentCalendar = Calendar.current
        let completionDate = currentCalendar.date(byAdding: .hour, value: 2, to: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, h"
        print("Seems you changed the time you want this task to be completed. Your new time to complete is \(dateFormatter.string(from: completionDate!)) hours from now.")
        
        taskArray.append(editedTask)
    }
    
}
