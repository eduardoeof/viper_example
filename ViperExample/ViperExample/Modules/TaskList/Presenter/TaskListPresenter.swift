//
//  TaskListPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class TaskListPresenter : TaskListPresenterProtocol  {
    var interactor: TaskListInteractorInputProtocol?
    var wireframe: TaskListWireframeProtocol?
    
    weak var view: TaskListViewProtocol?
    
    // MARK: ListPresenterProtocol methods
    
    func updateView() {
        interactor?.fetchList()
    }
    
    func didTapAddBarButton() {
        wireframe?.pushCreation()
    }
    
}

// MARK: ListInteractorOutputProtocol

extension TaskListPresenter : TaskListInteractorOutputProtocol {

    func didFetchList(taskList: [Task]) {
        let textList = extractTextsFromTaskList(taskList)
        view?.showList(textList)
    }
    
    func didFailFetchList(error: TaskError) {
        if error == .EmptyList {
            view?.showAlert(title: "Error",
                      description: "Your task list is empty! Go and find something to do!")
        }
    }
    
    // MARK: Private
    
    private func extractTextsFromTaskList(taskList: [Task]) -> [String] {
        var textList: [String] = []
        for task in taskList {
            textList.append(task.text)
        }
        
        return textList
    }
    
}
