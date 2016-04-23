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
    private let connector: TaskConnectorProtocol
    
    init(dao: TaskDAO, connector: TaskConnectorProtocol) {
        self.dao = dao
        self.connector = connector
    }

    convenience init() {
        self.init(dao: TaskMemoryDAO(), connector: TaskConnectorREST())
    }
    
    // ListInteractorInputProtocol
    
    func fetchList() {
        if let list = dao.loadTasks() {
            presenter?.didFetchList(list)
            return
        }
        
        connector.fetchTasks({
            [weak self] list in
            self?.presenter?.didFetchList(list)
            
        }, errorBlock: {
            [weak self] error in
            self?.presenter?.didFailFetchList(TaskError.EmptyList)
        })
        
    }
    
}