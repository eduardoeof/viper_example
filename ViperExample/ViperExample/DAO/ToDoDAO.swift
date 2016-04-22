//
//  ToDoDAO.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

protocol ToDoDAO {
    func saveToDo(todo: Task)
    func loadToDos() -> [Task]?
}