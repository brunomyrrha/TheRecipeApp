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
        // Show initial fetch recipe viewController without push animation.
        let viewController = FetchRecipesViewController.initFromStoryboard(named: storyboardName)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showRecipesListViewController(_ recipesList: [Recipe]) {
        // Show recipe list with navbar and push animation. The list should be injected.
        let viewController = RecipesListViewController.initFromStoryboard(named: storyboardName)
        viewController.recipesList = recipesList
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - VIEWCONTROLLER DELEGATES
extension FoodListCoordinator: FetchRecipesViewControllerDelegate {
    func didTapFetchRecipes(in viewController: FetchRecipesViewController) {
        // Should call RecipesServices and return the contents of fetch recipes list to a recipesList.
        let service = RecipesService()
        
        // Show loading animation
        viewController.isLoading(true)
        // Call service fetch
        service.fetchRecipes { (recipesList, error) in
            if let recipes = recipesList {
                DispatchQueue.main.async {
                    viewController.isLoading(false)
                    self.showRecipesListViewController(recipes)
                }
            } else {
                DispatchQueue.main.async {
                    viewController.isLoading(false)
                    viewController.showErrorMessage(error?.localizedDescription)
                }
            }
        }
    }
}
