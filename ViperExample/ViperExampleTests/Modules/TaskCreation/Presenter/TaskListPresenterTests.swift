//
//  TaskListPresenterTests.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/23/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import XCTest
@testable import ViperExample

class TaskListPresenterTests : XCTestCase {
    
    var presenter: TaskListPresenter!
    
    // MARK: XCTestCase
    
    override func setUp() {
        presenter = TaskListPresenter()
    }
    
    // MARK: Test cases
    
    func testUpdateView() {
        let expectation = self.expectationWithDescription("Check if presenter call interactor's fetchList method")
        
        let interactor = TaskListInteractorMock()
        interactor.expectation = expectation
        
        presenter.interactor = interactor
        presenter.updateView()
        
        waitForExpectations()
    }
    
    func testTapAddBarButton() {
        let expectation = self.expectationWithDescription("Check if presenter call wireframe's pushTaskCreation method")
        
        let wireframe = TaskListWireframeMock()
        wireframe.expectation = expectation
        
        presenter.wireframe = wireframe
        presenter.didTapAddBarButton()
        
        waitForExpectations()
    }
    
    // didTapAddBarButton()
    // didFetchList
    // didFailFetchList
}

// MARK: Mocks TaskListView

class TaskListViewMock : TaskListViewProtocol {
    var expectation: XCTestExpectation?
    var presenter: TaskListPresenterProtocol?
    var list: [String]?
    var title: String?
    var description: String?
    
    func showList(list: [String]) {
        self.list = list
        expectation?.fulfill()
    }
    
    func showAlert(title title: String, description: String) {
        self.title = title
        self.description = description
        expectation?.fulfill()
    }
    
}

// MARK: Mocks TaskListInteractor

class TaskListInteractorMock : TaskListInteractorInputProtocol {
    var expectation: XCTestExpectation?
    weak var presenter: TaskListInteractorOutputProtocol?
    
    func fetchList() {
        expectation?.fulfill()
    }
    
}

// MARK: Mocks TaskListWireframe

class TaskListWireframeMock : TaskListWireframeProtocol {
    var expectation: XCTestExpectation?
    
    static func addTaskListOnWindow(window: UIWindow) {}
    
    func pushTaskCreation() {
        expectation?.fulfill()
    }
    
}
