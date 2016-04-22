//
//  TaskListProtocols.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/16/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

protocol TaskListWireframeProtocol : class {
    static func addTaskListOnWindow(window: UIWindow)
    
    func pushCreation()
}

protocol TaskListViewProtocol : class {
    var presenter: TaskListPresenterProtocol? { get set }
    
    func showList(list: [String])
    func showAlert(title title: String, description: String)
}

protocol TaskListPresenterProtocol : class {
    var interactor: TaskListInteractorInputProtocol? { get set }
    var wireframe: TaskListWireframeProtocol? { get set }
    
    weak var view: TaskListViewProtocol? { get set }
    
    func updateView()
    func didTapAddBarButton()
}

protocol TaskListInteractorInputProtocol : class {
    weak var presenter: TaskListInteractorOutputProtocol? { get set }
    
    func fetchList()
}

protocol TaskListInteractorOutputProtocol : class {
    func didFetchList(list: [Task])
    func didFailFetchList(error: TaskError)
}
