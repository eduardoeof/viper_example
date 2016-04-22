//
//  TaskListView.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class TaskListView : UIViewController {
    var presenter: TaskListPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!

    private var taskList: [String]?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.updateView()
    }
    
    // MARK: IBAction
    
    @IBAction func tapAddBarButton() {
        presenter?.didTapAddBarButton()
    }
    
    // MARK: Private
    
    private func setupNavigationBar() {
        title = "List"
        
        let button = initAddBarButton()
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }
    
    private func initAddBarButton() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Add", style: .Plain, target: self, action: Selector("tapAddBarButton"))
    }
}

// MARK: TaskListViewProtocol

extension TaskListView : TaskListViewProtocol {
    
    func showList(list: [String]) {
        taskList = list
        tableView.reloadData()
    }
 
    func showAlert(title title: String, description: String) {
        let alertController = UIAlertController(title: title,
                                              message: description,
                                       preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) {
            alertAction in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

// MARK: UITableViewDataSource

extension TaskListView : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = initCell()
        
        if let text = taskList?[indexPath.row] {
            setupCell(cell, text: text)
        }
        
        return cell
    }
    
    // MARK: Private
    
    private func initCell() -> UITableViewCell {
        let identifier = String(UITableViewCell)
        return tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
    }
    
    private func setupCell(cell: UITableViewCell, text: String) {
        cell.textLabel?.text = text
    }
    
}