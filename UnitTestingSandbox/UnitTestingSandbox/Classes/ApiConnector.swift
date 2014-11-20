//
//  ApiConnector.swift
//  UnitTestingSandbox
//
//  Created by John Wakley on 20/11/2014.
//  Copyright (c) 2014 John Wakley. All rights reserved.
//

import Foundation

protocol ApiConnector {
    func fetchResource(request: String) -> [[String: String]]
}