//
//  MainInteractor.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class MainInteractor : MainInteractorInputProtocol {
    weak var presenter: MainInteractorOutputProtocol?
    
    private let dao: ToDoDAO
    
    init(dao: ToDoDAO) {
        self.dao = dao
    }

    convenience init() {
        self.init(dao: ToDoMemoryDAO())
    }
    
    // MainInteractorInputProtocol
    
    func fetchToDoList() {
        guard let list = dao.loadToDos() else {
            presenter?.didFailFetchToDoList(ToDoError.EmptyList)
            return
        }
        
        presenter?.didFetchToDoList(list)
    }
    
}