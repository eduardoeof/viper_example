//
//  CreateProtocols.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

protocol CreationWireframeProtocol : class {
    
}

protocol CreationViewProtocol : class {
    var presenter: CreationPresenterProtocol? { get set }
}

protocol CreationPresenterProtocol : class {
    var interactor: CreationInteractorInputProtocol? { get set }
    var wireframe: CreationWireframeProtocol? { get set }
    
    weak var view: CreationViewProtocol? { get set }
}

protocol CreationInteractorInputProtocol : class {
    weak var presenter: CreationInteractorOutputProtocol? { get set }
}

protocol CreationInteractorOutputProtocol : class {
    
}
