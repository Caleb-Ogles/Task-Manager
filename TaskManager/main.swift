//
//  main.swift
//  TaskManager
//
//  Created by Caleb Ogles on 9/17/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

//This will call the log in function to prompt the user to log in before they can access the entire program.
logIn()

//This is the greeting statement when the user opens the program for the first time.
print("Welcome to your Task Manager! we make sure you're daily needs get done without any troubles whatsoever!\n")

let taskManagerMenu = Menu() //This piece here creates an instance of our Menu class.
taskManagerMenu.launchProgram() //Using the instance of the Menu class we call the launchProgram function and this is what allows the program to start up and begin.

