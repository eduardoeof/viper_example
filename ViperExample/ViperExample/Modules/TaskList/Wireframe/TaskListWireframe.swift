//
//  TaskListWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

//
//  TaskListWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

class TaskListWireframe : TaskListWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
    class func addTaskListOnWindow(window: UIWindow) {
        let wireframe = TaskListWireframe()
        let view = TaskListView()
        let presenter = TaskListPresenter()
        let interactor = TaskListInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        wireframe.navigationController = navigationController
        window.rootViewController = navigationController
    }
    
    // MARK: ListWireframeProtocol
    
    func pushTaskCreation() {
        if let navigationController = navigationController {
            TaskCreationWireframe.pushTaskCreation(navigationController)
        }
    }
    
}