//
//  ViewControllerExtension.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/*ViewController helpers and extensions*/

import UIKit

extension UIViewController {
    
    private class func initFromStoryboardHelper<T>(storyboard: String) -> T {
        //Generic self calling method to help initialization from storyboard name. As this class uses the viewController self name, the storyboard and the swift file should have the same name.
        let filename = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: filename) as! T
        return viewController
    }
    
    static func initFromStoryboard(named: String) -> Self {
        //Exposed method to any viewController self initialize with only storyboard name.
        return initFromStoryboardHelper(storyboard: named)
    }
}
