//
//  TaskConnector.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/23/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

protocol TaskConnectorProtocol {
    func fetchTasks(successBlock: ([Task] -> ()), errorBlock: ((TaskConnectorError) -> ()))
}