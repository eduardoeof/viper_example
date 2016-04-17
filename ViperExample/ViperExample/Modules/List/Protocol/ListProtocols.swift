//
//  ListProtocols.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/16/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation
import UIKit

protocol ListWireframeProtocol : class {
    static func addListOnWindow(window: UIWindow)
    
    func pushCreation()
}

protocol ListViewProtocol : class {
    var presenter: ListPresenterProtocol? { get set }
    
    func showList(list: [String])
    func showAlert(title title: String, description: String)
}

protocol ListPresenterProtocol : class {
    var interactor: ListInteractorInputProtocol? { get set }
    var wireframe: ListWireframeProtocol? { get set }
    
    weak var view: ListViewProtocol? { get set }
    
    func updateView()
    func didTapAddBarButton()
}

protocol ListInteractorInputProtocol : class {
    weak var presenter: ListInteractorOutputProtocol? { get set }
    
    func fetchList()
}

protocol ListInteractorOutputProtocol : class {
    func didFetchList(list: [ToDo])
    func didFailFetchList(error: ToDoError)
}
