//
//  TaskRESTConnector.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/23/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

// WARNING: This class doesn't execute web requests. It just represent a data access layer for this projects.

import Foundation

class TaskConnectorREST : TaskConnectorProtocol {
    
    func fetchTasks(successBlock: ([Task] -> ()), errorBlock: ((TaskConnectorError) -> ())) {
        
        var list: [Task]?
        let task1 = Task(text: "Do it")
        let task2 = Task(text: "Do that")
        let task3 = Task(text: "Do everything")
        list = [task1, task2, task3]
        
        if let list = list {
            successBlock(list)
            
        } else {
            errorBlock(TaskConnectorError.InternalServerError)
        }
        
    }

}