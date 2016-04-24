//
//  XCTestCase+Expectation.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/23/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import XCTest

extension XCTestCase {
    func waitForExpectations() {
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}
