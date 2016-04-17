//
//  ListWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

class ListWireframe : ListWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
    class func addListOnWindow(window: UIWindow) {
        let wireframe = ListWireframe()
        let view = ListView()
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        interactor.presenter = presenter
        
        let navigationController = UINavigationController.init(rootViewController: view)
        wireframe.navigationController = navigationController
        window.rootViewController = navigationController
    }
    
}