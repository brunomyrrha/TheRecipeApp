//
//  FoodListCoordinator.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

//* Coordinator that controls FoodList storyboard viewControllers stack and viewControllers delegates. */

import UIKit

class FoodListCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let storyboardName = "Recipes"
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - INITIALIZATION
    func start() {
        showFetchRecipesViewController()
    }
    
    // MARK: - VIEWCONTROLLERS CALLERS
    func showFetchRecipesViewController() {
        // Show initial fetch recipe viewController without navbar and push animation.
        let viewController = FetchRecipesViewController.initFromStoryboard(named: storyboardName)
        viewController.delegate = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showRecipesListViewController(_ recipeList: [Recipe]) {
        // Show recipe list with navbar and push animation. The list should be injected.
        let viewController = RecipesListViewController.initFromStoryboard(named: storyboardName)
        viewController.recipeList = recipeList
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - VIEWCONTROLLER DELEGATES
extension FoodListCoordinator: FetchRecipesViewControllerDelegate {
    func didTapFetchRecipes(in viewController: FetchRecipesViewController) {
        let recipeList = [Recipe]()
        viewController.isLoading(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            viewController.isLoading(false)
            viewController.showError()
        }
    }
}
