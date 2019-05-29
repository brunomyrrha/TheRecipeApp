//
//  FetchRecipesViewController.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

import UIKit

protocol FetchRecipesViewControllerDelegate: class {
    func didTapFetchRecipes(in viewController: FetchRecipesViewController)
}

class FetchRecipesViewController: UIViewController {
    
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var delegate: FetchRecipesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapFetchRecipes(_ sender: Any) {
        delegate?.didTapFetchRecipes(in: self)
    }
    
    func isLoading(_ loading: Bool){
        //Controls button and activity behaviours
        if loading {
            fetchButton.isHidden = true
            activityIndicator.startAnimating()
        } else {
            fetchButton.isHidden = false
            activityIndicator.stopAnimating()
        }
    }
    
    func showErrorMessage(_ message: String?) {
        let alertController = UIAlertController(title: "Ops...", message: message ?? "Something got wrong while fetching data. Try again later.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
