//
//  CreationInteractor.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class CreationInteractor : CreationInteractorInputProtocol {
    weak var presenter: CreationInteractorOutputProtocol?
    
    let dao: ToDoDAO
    
    init(dao: ToDoDAO) {
        self.dao = dao
    }
    
    convenience init() {
        self.init(dao: ToDoMemoryDAO())
    }
    
    // MARK: CreationInteractorInputProtocol
    
    func createToDo(text: String) {
        let task = Task(text: text)
        dao.saveToDo(task)
        
        presenter?.didInsertToDo()
    }
}