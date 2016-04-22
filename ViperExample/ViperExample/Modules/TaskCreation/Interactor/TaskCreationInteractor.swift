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
    
    let dao: TaskDAO
    
    init(dao: TaskDAO) {
        self.dao = dao
    }
    
    convenience init() {
        self.init(dao: TaskMemoryDAO())
    }
    
    // MARK: TaskCreationInteractorInputProtocol
    
    func createTask(text: String) {
        let task = Task(text: text)
        dao.saveTask(task)
        
        presenter?.didInsertTask()
    }
}