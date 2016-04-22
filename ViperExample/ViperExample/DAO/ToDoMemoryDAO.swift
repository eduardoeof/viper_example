//
//  ToDoMemoryDAO.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class ToDoMemoryDAO : ToDoDAO {
    
    static var list: [Task]?
    
    init() {
        if ToDoMemoryDAO.list == nil {
            let todo1 = Task(text: "Do it")
            let todo2 = Task(text: "Do that")
            let todo3 = Task(text: "Do everything")
            
            ToDoMemoryDAO.list = [todo1, todo2, todo3]
        }
    }
    
    // MARK: ToDoDAO
    
    func saveToDo(todo: Task) {
        ToDoMemoryDAO.list?.append(todo)
    }
    
    func loadToDos() -> [Task]? {
        return ToDoMemoryDAO.list
    }
}