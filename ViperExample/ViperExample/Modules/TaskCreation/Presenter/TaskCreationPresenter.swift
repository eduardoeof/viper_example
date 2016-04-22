//
//  TaskCreationPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class TaskCreationPresenter : TaskCreationPresenterProtocol {
    var interactor: TaskCreationInteractorInputProtocol?
    var wireframe: TaskCreationWireframeProtocol?
    
    weak var view: TaskCreationViewProtocol?
    
    // MARK: TaskCreationPresenterProtocol
    
    func didTapCreateButton(text: String) {
        interactor?.createTask(text)
    }
    
}

// MARK: TaskCreationInteractorOutputProtocol

extension TaskCreationPresenter : TaskCreationInteractorOutputProtocol {

    func didInsertTask() {
        wireframe?.popTaskCreation()
    }
    
}
