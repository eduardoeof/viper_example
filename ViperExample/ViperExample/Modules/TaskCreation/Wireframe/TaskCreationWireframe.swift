//
//  TaskCreationWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class TaskCreationWireframe : TaskCreationWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
    // MARK: TaskCreationWireframeProtocol
    
    class func pushTaskCreation(navigationController: UINavigationController) {
        let wireframe = TaskCreationWireframe()
        let view = TaskCreationView()
        let presenter = TaskCreationPresenter()
        let interactor = TaskCreationInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        interactor.presenter = presenter
        
        wireframe.navigationController = navigationController
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func popTaskCreation() {
        navigationController?.popViewControllerAnimated(true)
    }
    
}