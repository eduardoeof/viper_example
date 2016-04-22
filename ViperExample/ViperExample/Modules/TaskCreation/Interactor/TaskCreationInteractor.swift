//
//  TaskCreationInteractor.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class TaskCreationInteractor : TaskCreationInteractorInputProtocol {
    weak var presenter: TaskCreationInteractorOutputProtocol?
    
    let dao: ToDoDAO
    
    init(dao: ToDoDAO) {
        self.dao = dao
    }
    
    convenience init() {
        self.init(dao: ToDoMemoryDAO())
    }
    
    // MARK: TaskCreationInteractorInputProtocol
    
    func createToDo(text: String) {
        let task = Task(text: text)
        dao.saveToDo(task)
        
        presenter?.didInsertToDo()
    }
}