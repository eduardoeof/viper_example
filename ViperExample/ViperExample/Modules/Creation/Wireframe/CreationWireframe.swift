//
//  CreationWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class CreationWireframe : CreationWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
    // MARK: CreationWireframeProtocol
    
    class func pushCreation(navigationController: UINavigationController) {
        let wireframe = CreationWireframe()
        let view = CreationView()
        let presenter = CreationPresenter()
        let interactor = CreationInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        interactor.presenter = presenter
        
        wireframe.navigationController = navigationController
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func popCreation() {
        navigationController?.popViewControllerAnimated(true)
    }
    
}