//
//  ListPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class ListPresenter : ListPresenterProtocol  {
    var interactor: ListInteractorInputProtocol?
    var wireframe: ListWireframeProtocol?
    
    weak var view: ListViewProtocol?
    
    // MARK: ListPresenterProtocol methods
    
    func updateView() {
        interactor?.fetchList()
    }
    
    func didTapAddBarButton() {
        wireframe?.pushCreation()
    }
    
}

// MARK: ListInteractorOutputProtocol

extension ListPresenter : ListInteractorOutputProtocol {

    func didFetchList(toDoList: [ToDo]) {
        let textList = extractTextsFromToDoList(toDoList)
        view?.showList(textList)
    }
    
    func didFailFetchList(error: ToDoError) {
        if error == .EmptyList {
            view?.showAlert(title: "Error",
                      description: "Your ToDo list is empty! Go and find something to do!")
        }
    }
    
    // MARK: Private
    
    private func extractTextsFromToDoList(toDoList: [ToDo]) -> [String] {
        var textList: [String] = []
        for todo in toDoList {
            textList.append(todo.text)
        }
        
        return textList
    }
    
}
