//
//  MainView.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class MainView: UIViewController, MainViewProtocol {
    var presenter: MainPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}