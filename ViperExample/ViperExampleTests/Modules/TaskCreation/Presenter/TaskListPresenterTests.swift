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
    
    func testDidFetchList() {
        let expectation = self.expectationWithDescription("Check if presenter call view's showList method")
        
        let view = TaskListViewMock()
        view.expectation = expectation
        
        let list = createTaskList()
        
        presenter.view = view
        presenter.didFetchList(list)
        
        waitForExpectations()
        
        XCTAssertEqual(view.list?.count, list.count)
        XCTAssertEqual(view.list?[0], list[0].text)
        XCTAssertEqual(view.list?[1], list[1].text)
        XCTAssertEqual(view.list?[2], list[2].text)
    }
    
    func testDidFailFetchList() {
        let expectation = self.expectationWithDescription("Check if presenter call view's showAlert method")
        
        let view = TaskListViewMock()
        view.expectation = expectation
        
        presenter.view = view
        presenter.didFailFetchList(.EmptyList)
        
        waitForExpectations()
        
        XCTAssertEqual(view.title, "Error")
        XCTAssertEqual(view.description, "Your task list is empty! Go and find something to do!")
    }
    
    // MARK: Private
    
    private func createTaskList() -> [Task] {
        let task1 = Task(text: "Do it")
        let task2 = Task(text: "Do that")
        let task3 = Task(text: "Do something")
        return [task1, task2, task3]
    }
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
