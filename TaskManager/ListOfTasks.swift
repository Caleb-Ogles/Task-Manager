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
        //The beginning of our task menu starts with the CreateTask function that bascially asks the user for input to create a new task.
        print("Adding a new task to your day?? Very well enter your new task.")
        //Here it asks for user input to create a new tasks name and validates the input.
        var newTaskName = readLine()
        while newTaskName == nil || newTaskName == "" {
            print("Oops! Invalid name, please enter a valid name for your task.")
            newTaskName = readLine()
        }
        print("Please enter the description of your new task.")
        //Here it asks for user input to create a new tasks description and and also validates the input provided.
        var newTaskDescription = readLine()
        while newTaskDescription == nil || newTaskDescription == "" {
            print("Oops! Invalid description, please enter a valid description for your task.")
            newTaskDescription = readLine()
        }
        //This puts the name and description together and makes them into one.
        let newTask = Task(title: newTaskName!, detailsOfTask: newTaskDescription!)
        //Starting here we have the little bit that creates the date the task is to be completed by using calendar.
        let currentCalendar = Calendar.current
        let completionDate = currentCalendar.date(byAdding: .hour, value: 4, to: Date())
        
        //This is the date formatter that tells the date through what day it is and how many hours until completion.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, h"
        print("You told me to tell you that this task is to be completed on \(dateFormatter.string(from: completionDate!)) hours from now.")
        //Finally this adds the new task to our array of tasks.
        taskArray.append(newTask)
    }
    
    func removeTask() {
        //This basically goes through the array and for each task in the array it prints the task out for the user to select for the function
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].title)")
        }
        print("No longer need a task?? Alrighty then, please enter the task you want to remove.")
        
        //This little portion takes user input in the form of an integer and also validates the number the user enters to make sure it is a valid number the program can use.
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<taskArray.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Oops! Invalid option. Please enter a valid option.")
            userInput = Int(readLine()!)
        }
        //This removes the task the user selects from the list that is shown.
        taskArray.remove(at: userInput!)
        
    }
    
    func listOfAllTasks() {
        //Goes through each task that is currently in the array and prints each one out into a list
        for task in taskArray {
            print("\(task.title), Description: \(task.detailsOfTask)")
        }
    }
    
    func listOfAllCompletedTasks() {
        //If the completionStatus for each current task is set to true then it prints out each of those tasks marked that way because they are completed.
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == true {
                print("\(index). \(taskArray[index].title), Description: \(taskArray[index].detailsOfTask)")
            }
        }
    }
    
    func listOfAllUncompletedTasks() {
        //If the completionStatus for each current task is set to false then it prints out each of those tasks marked that way because they are uncompleted.
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == false {
                print("\(index). \(taskArray[index].title), \(taskArray[index].detailsOfTask)")
            }
        }
    }
    
    func listTaskAsComplete() {
        //This goes through and prints each task that isn't marked true for complete into a list.
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == false {
                print("\(index). \(taskArray[index].title)")
            }
        }
        print("Ooooo you completed a task! Congrats on being productive! Please select the task you would like to mark as complete.")
        
        //User input is taken here in an integer form and also validates to make sure the input can be used.
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Oops! Invalid selection. Please select a valid option.")
            userInput = Int(readLine()!)
        }
        
        //These two lines change the completionStatus value to true to mark it as complete and then changes the completionDate value to nil to act as if removing the date to complete by because the task is ocmplete.
        taskArray[userInput!].completionStatus = true
        taskArray[userInput!].completionDate = nil
        
    }
    
    func listTaskAsUncomplete() {
        //Goes through and prints each task that isn't marked false for uncomplete into a list.
        for index in 0..<taskArray.count {
            if taskArray[index].completionStatus == true {
                print("\(index). \(taskArray[index].title)")
            }
        }
        print("Well I guess one uncomplete task wont hurt a bit would it? Please select the task that was completed that you would then like to mark as uncomplete.")
        
        //Takes user input as an integer and also validates it to make sure it is useable.
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Oops! Invalid selection. Please enter a valid option.")
            userInput = Int(readLine()!)
        }
        
        //Changes the task that the user selected to false so it is now marked as uncomplete where before it was marked as complete.
        taskArray[userInput!].completionStatus = false
        
    }
    
    func easterEgg() {
        
        //Connects the menu to the easter egg function in order for the quit() function to be called at the end.
        let forceQuit = Menu()
        
        //Print statements for the easter egg and contains the sleep function to allow for a better format
        print("Wait where did the user go??...\n")
        sleep(5)
        print("OH! Hello... there?\n")
        sleep(5)
        print("Welcome to the wall behind the program, otherwise known as the \"code\".\n")
        sleep(6)
        print("Uhhhhhhh you're not really suppose to be back here but um here you are I guess :|\n")
        sleep(6)
        print("I'm running out of things to say and like I said you aren't suppose to be here sooooo I would consider restarting the program if I were you.\n")
        sleep(6)
        print("Seriously. Do it. If my boss see's you back here they'll freak and I may lose my job.\n")
        sleep(5)
        print("So... Please.\n")
        sleep(5)
        print("Well I see you're not gonna do it soooo i'll do it myself. Bye bye!! :)\n")
        sleep(5)
        forceQuit.quit()
    }
    
}
