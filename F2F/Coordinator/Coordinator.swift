//
//  Coordinator.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/* Protocol that grants that every coordinator manager will have a navigation controller and a start() method to be initialized. */

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    func start()
}
