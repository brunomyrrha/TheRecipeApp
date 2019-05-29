//
//  RecipesResponse.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/* Recipes response model from f2f. All variables must conform to codable */

import Foundation

struct RecipesResponse: Codable {
    var count: Int
    var recipes: [Recipe]
}
