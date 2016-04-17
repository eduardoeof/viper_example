//
//  ToDoMemoryDAO.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class ToDoMemoryDAO : ToDoDAO {
    
    static var list: [ToDo]?
    
    init() {
        if ToDoMemoryDAO.list == nil {
            let todo1 = ToDo(text: "Do it")
            let todo2 = ToDo(text: "Do that")
            let todo3 = ToDo(text: "Do everything")
            
            ToDoMemoryDAO.list = [todo1, todo2, todo3]
        }
    }
    
    // MARK: ToDoDAO
    
    func saveToDo(todo: ToDo) {
        ToDoMemoryDAO.list?.append(todo)
    }
    
    func loadToDos() -> [ToDo]? {
        return ToDoMemoryDAO.list
    }
}