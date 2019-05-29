//
//  RecipesService.swift
//  F2F
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

/* Here all requests to Food2Fork are made*/

import Foundation

class RecipesService {
    private let apiKey = "6069da7b8a6af285c726f3add56ea305"
    private let baseURL: String
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    
    init() {
        baseURL = "https://www.food2fork.com/api/search?key=\(apiKey)"
        session = URLSession(configuration: .default)
        jsonDecoder = JSONDecoder()
    }
    
    func fetchRecipes(callback: @escaping ([Recipe]?,Error?)->()) {
        // Get all recipes without filter. The session task verifies if the response is between 200 to 299 and if the data is not nil to proceed. This uses a callback to get the response using closures.
        let fetchUrl = URL(string: baseURL)!
        let request = URLRequest(url: fetchUrl)
        let sessionTask: URLSessionTask = session.dataTask(with: request) {
            (data, httpResponse, httpError) in
            if let response = httpResponse as? HTTPURLResponse, 200...299 ~= response.statusCode, let data = data {
                //Trying to decode data
                do {
                    let recipesListResponse = try self.jsonDecoder.decode(RecipesResponse.self, from: data)
                    // If data is successfully decoded, calls the callback with recipe list
                    callback(recipesListResponse.recipes,nil)
                } catch {
                    // If data is not successfully decoded, returns the catch error
                    callback(nil, error)
                }
            } else {
                // In case of response or data error, returns the http error
                callback(nil, httpError)
            }
        }
        sessionTask.resume()
        
    }
}
