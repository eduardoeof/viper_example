//
//  CreationView.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class CreationView : UIViewController, CreationViewProtocol {
    var presenter: CreationPresenterProtocol?
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: IBAction
    
    @IBAction func tapCreateButton() {
        print("Click!!!!!!")
    }
}
