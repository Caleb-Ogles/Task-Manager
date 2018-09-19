//
//  MainMenu.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/17/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

var quitProgram = false //When this equals true the program will close.

class Menu {
    
    let TaskManager = ListOfTasks()
    
    func launchProgram() {
        //This function will launch the program as a whole.
        while !quitProgram {
            printMenu()
            var input = getUserInput()
            while !validateInput(input) {
                printMenu()
                input = getUserInput()
            }
            handleInput(input)
            
        }
    }
    
    //This function overlooks the user input and validates it as the user enters it. if the user enters something that isn't valid then it will ask the user to enter a new option until they get a valid one.
    func validateInput(_ input: String) -> Bool {
        let validMenuOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
    }
    
    func printMenu() {
        //This function will act in printing the menu for the user to observe and select the options that are presented.
        
        print("""
                   Task Manager v.12
        ----------------------------------------
        1) Create New Task                      |
        2)  Delete a Task                       |
        3) List of all Tasks                    |
        4)  List of all Completed Tasks         |
        5) List of all Uncompleted Tasks        |
        6)  List a Task as Complete             |
        7) List a Completed Task as Uncompleted |
        8)  Quit Application                    |
        ----------------------------------------
        
        What would you like do? (select a number between 1 and 8)
        """)
    }
    
    func handleInput(_ input: String) {
        //This function handles user input. they enter a number between 1 and 8 and when selecting one of those numbers they are taken to option of whatever number they selected.
        switch input {
        case "1":
            TaskManager.CreateTask()
        case "2":
            TaskManager.removeTask()
        case "3":
            TaskManager.listOfAllTasks()
        case "4":
            TaskManager.listOfAllCompletedTasks()
        case "5":
            TaskManager.listOfAllUncompletedTasks()
        case "6":
            TaskManager.listTaskAsComplete()
        case "7":
            TaskManager.listTaskAsUncomplete()
        case "8":
            quit()
        default:
            break
        }
    }
    
    func quit() {
        //This function when called by the user will close the program.
        quitProgram = true
        //This also will print this closing statement.
        print("Thank you for using Task Manager! Have a nice day!")
    }
    
    func getUserInput() -> String {
        //This function works as getting the user to enter input for one of the options in the task manager. If the input is nil or an empty string then it will print the statement "Invalid selection. Please enter a valid" and ask for input over and pver until the user enters something valid.
        var userInput = readLine()
        
        while userInput == nil || userInput == "" {
            print("Invalid selection. Please enter a valid")
            userInput = readLine()
        }
        return userInput!
    }
    
}
