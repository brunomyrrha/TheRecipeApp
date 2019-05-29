//
//  Recipe.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/* Model class for recipes conforming to codable. */

import Foundation

struct Recipe: Codable {
    var publisher: String
    var f2fUrl: String
    var title: String
    var sourceUrl: String
    var id: Int
    var imageUrl: String
    var socialRank: Int
    var publisherUrl: String
    
    // Ensure that the variable names are in compliance with json response
    enum CodingKeys: String, CodingKey {
        case publisher = "publisher"
        case f2fUrl = "f2f_url"
        case title = "title"
        case sourceUrl = "source_url"
        case id = "recipe_id"
        case imageUrl = "image_url"
        case socialRank = "social_rank"
        case publisherUrl = "publisher_url"
    }
}
