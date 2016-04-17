//
//  MainProtocol.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/16/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

protocol MainWireframeProtocol : class {

}

protocol MainViewProtocol : class {
    var presenter: MainPresenterProtocol? { get set }
    
    func showToDoList(list: [String])
}

protocol MainPresenterProtocol : class {
    var interactor: MainInteractorInputProtocol? { get set }
    var wireframe: MainWireframeProtocol? { get set }
    
    weak var view: MainViewProtocol? { get set }
    
    func updateView()
}

protocol MainInteractorInputProtocol : class {
    weak var presenter: MainInteractorOutputProtocol? { get set }
    
    func fetchToDoList()
}

protocol MainInteractorOutputProtocol : class {
    func didFetchToDoList(list: [ToDo])
    func didFailFetchToDoList(error: ErrorType)
}
