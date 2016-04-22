//
//  TaskCreationView.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class TaskCreationView : UIViewController, TaskCreationViewProtocol {
    var presenter: TaskCreationPresenterProtocol?
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTextField()
    }
    
    // MARK: IBAction
    
    @IBAction func tapCreateButton() {
        guard let text = textField.text where !text.isEmpty else {
            return
        }
        
        presenter?.didTapCreateButton(text)
    }
    
    // MARK: Private
    
    private func setupNavigationBar() {
        title = "Create"
    }
    
    private func setupTextField() {
        textField.delegate = self
    }
}

extension TaskCreationView : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if self.textField == textField {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
}
