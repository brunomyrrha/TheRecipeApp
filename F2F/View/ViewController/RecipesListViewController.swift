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
    var recipeList = [Recipe]()
    
    override func viewDidLoad() {
        // On viewLoad, checks if the recipe list is empty and sets the table view visibility
        configureTableView()
        super.viewDidLoad()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = recipeList.isEmpty
    }
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Try to load Image from URL and than sets to cell.
        var loadedImage: UIImage?
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeTableViewCell
        let url = NSURL(string: recipeList[indexPath.row].imageUrl)! as URL
        if let image: NSData = NSData(contentsOf: url) {
            loadedImage = UIImage(data: image as Data)
        }  
        if loadedImage != nil {
            cell.recipeImage.image = loadedImage
        }
        cell.recipeNameLabel.text = recipeList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of cells that tableview should have. In this case, it uses the recipeList as counter.
        return recipeList.count
    }
    
    
}
