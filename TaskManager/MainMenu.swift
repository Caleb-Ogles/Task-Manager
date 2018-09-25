//
//  MainMenu.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/17/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

//This is the log in function that takes in user input as a string for both the user name and password and also validates both to make sure they are usable. When the user enters both correctly, then the program should open and run.
func logIn() {
    print("Welcome! Please enter your username please.")
    var userName = readLine()
    while userName == nil || userName == "" {
        print("Whoops! The username you entered does not exist. Please try again.")
        userName = readLine()
    }
    print("Enter your password that goes along with this username.")
    var password = readLine()
    while password == nil || password == "" {
        print("Whoops! The password you entered is incorrect. Please try again.")
        password = readLine()
    }
}

var quitProgram = false //When this equals true the program will close.

class Menu {
    
    //This connects our list of functions for the task menu to allow us to use user input to call these function.
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
        let validMenuOptions = Array(1...9)
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
        8)  Edit a Task                         |
        9) Quit Application                     |
        ----------------------------------------
        
        What would you like do? (select a number between 1 and 8)
        """)
    }
    
    func handleInput(_ input: String) {
        //This function handles user input. they enter a number between 1 and 9 and when selecting one of those numbers they are taken to option of whatever number they selected.
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
        case "9":
            TaskManager.easterEgg()
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
