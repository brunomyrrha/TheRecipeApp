//
//  RecipesListViewController.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //The list is initialized to avoid nil recipe errors.
    var recipesList = [Recipe]()
    
    override func viewDidLoad() {
        // On viewLoad, checks if the recipe list is empty and sets the table view visibility and adds the navitem
        addSortNavBarButton()
        configureTableView()
        super.viewDidLoad()
    }
    
    private func configureTableView() {
        // Settings for tableview work correctly.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = recipesList.isEmpty
        navigationItem.rightBarButtonItem?.isEnabled = !tableView.isHidden //Verify if the table view was loaded to enable the sort button
        
    }
    
    private func addSortNavBarButton() {
        // Adds the sort button to the navbar
        let sortBarItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(showSortAlert))
        navigationItem.setRightBarButton(sortBarItem, animated: false)
    }
    
    @objc private func showSortAlert() {
        // Presents an alert with cancel and sort options to user
        let alertController = UIAlertController(title: "Sort?", message: "Do you want to sort the recipe list in alphabetical order?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .destructive) { (UIAlertAction) in
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
        let sortAction = UIAlertAction(title: "Sort", style: .default) { (UIAlertAction) in
            self.sortList()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(sortAction)

        navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    private func sortList() {
        // Sort current list and reload tableview after
        recipesList = recipesList.sorted {
            $0.title < $1.title
        }
        tableView.reloadData()
    }
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Try to load Image from URL and than sets to cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeTableViewCell
        let url = URL(string: recipesList[indexPath.row].imageUrl)!
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                cell.recipeImage.image = UIImage(data: data)
            }
        }
        cell.recipeNameLabel.text = recipesList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of cells that tableview should have. In this case, it uses the recipesList as counter.
        return recipesList.count
    }
    
    
}
