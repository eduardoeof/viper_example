//
//  TaskCreationProtocols.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

protocol TaskCreationWireframeProtocol : class {
    static func pushTaskCreation(navigationController: UINavigationController)
    func popTaskCreation()
}

protocol TaskCreationViewProtocol : class {
    var presenter: TaskCreationPresenterProtocol? { get set }
}

protocol TaskCreationPresenterProtocol : class {
    var interactor: TaskCreationInteractorInputProtocol? { get set }
    var wireframe: TaskCreationWireframeProtocol? { get set }
    
    weak var view: TaskCreationViewProtocol? { get set }
    
    func didTapCreateButton(text: String)
}

protocol TaskCreationInteractorInputProtocol : class {
    weak var presenter: TaskCreationInteractorOutputProtocol? { get set }
    
    func createToDo(text: String)
}

protocol TaskCreationInteractorOutputProtocol : class {
    func didInsertToDo()
}
