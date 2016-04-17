//
//  MainWireframe.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

class MainWireframe : MainWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
    class func AddMainOnWindow(window: UIWindow) {
        let wireframe = MainWireframe()
        let view = MainView()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
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