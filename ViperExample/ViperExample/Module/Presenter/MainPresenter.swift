//
//  MainPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class MainPresenter : MainPresenterProtocol, MainInteractorOutputProtocol {
    var interactor: MainInteractorInputProtocol?
    var wireframe: MainWireframeProtocol?
    
    weak var view: MainViewProtocol?
}