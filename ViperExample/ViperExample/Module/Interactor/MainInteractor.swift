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
    
    // MainInteractorInputProtocol
    
    func fetchToDoList() {
        let todo1 = ToDo(text: "Do it")
        let todo2 = ToDo(text: "Do that")
        let todo3 = ToDo(text: "Do everything")
        let list = [todo1, todo2, todo3]
        
        presenter?.didFetchToDoList(list)
    }
    
}