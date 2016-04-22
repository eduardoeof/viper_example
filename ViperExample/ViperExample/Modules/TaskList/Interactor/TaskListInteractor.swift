//
//  TaskListInteractor.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class TaskListInteractor : TaskListInteractorInputProtocol {
    weak var presenter: TaskListInteractorOutputProtocol?
    
    private let dao: ToDoDAO
    
    init(dao: ToDoDAO) {
        self.dao = dao
    }

    convenience init() {
        self.init(dao: ToDoMemoryDAO())
    }
    
    // ListInteractorInputProtocol
    
    func fetchList() {
        guard let list = dao.loadToDos() else {
            presenter?.didFailFetchList(ToDoError.EmptyList)
            return
        }
        
        presenter?.didFetchList(list)
    }
    
}