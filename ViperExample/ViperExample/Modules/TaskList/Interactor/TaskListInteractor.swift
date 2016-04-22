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
    
    private let dao: TaskDAO
    
    init(dao: TaskDAO) {
        self.dao = dao
    }

    convenience init() {
        self.init(dao: TaskMemoryDAO())
    }
    
    // ListInteractorInputProtocol
    
    func fetchList() {
        guard let list = dao.loadTasks() else {
            presenter?.didFailFetchList(TaskError.EmptyList)
            return
        }
        
        presenter?.didFetchList(list)
    }
    
}