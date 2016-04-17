//
//  CreationPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class CreationPresenter : CreationPresenterProtocol {
    var interactor: CreationInteractorInputProtocol?
    var wireframe: CreationWireframeProtocol?
    
    weak var view: CreationViewProtocol?
    
    // MARK: CreationPresenterProtocol
    
    func didTapCreateButton(text: String) {
        interactor?.createToDo(text)
    }
    
}

// MARK: CreationInteractorOutputProtocol

extension CreationPresenter : CreationInteractorOutputProtocol {

    func didInsertToDo() {
        wireframe?.popCreation()
    }
    
}
