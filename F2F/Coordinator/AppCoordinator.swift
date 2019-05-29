//
//  AppCoordinator.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/* Initial Coordinator for the app that starts the UINavigationController stack. It's the only coordinator who should receive a window. Also this configures and start the stack. */

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let window: UIWindow
    private var childCoordinators: [Coordinator]
    
    init(window: UIWindow) {
        childCoordinators = []
        navigationController = UINavigationController()
        self.window = window
    }
    
    // MARK: - INITIALIZATION
    func start() {
        configureWindow()
    }
    
    private func configureWindow() {
        //Initial configuration of window, setting background and rootViewController
        window.backgroundColor? = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func configureNavigationControllerStyle() {
        //Initial configuration of navigationController stack style.
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.isHidden = false
    }
    
    // MARK: - CHILD COORDINATORS CALLERS
    
}
