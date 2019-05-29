//
//  F2FTests.swift
//  F2FTests
//
//  Created by Bruno Diniz on 29/05/2019.
//  Copyright © 2019 Bruno Diniz. All rights reserved.
//

import XCTest
@testable import F2F

class F2FTests: XCTestCase {

    var service: RecipesService?
    
    override func setUp() {
        service = RecipesService()
    }

    override func tearDown() {
        service = nil
    }

    func testRecipesInitialization() {
        // Grants that the setup conforms the current service initialization
        XCTAssertNotNil(service)
    }

    func testRecipesBases() {
        // Avoid changes on apiKey and URL and test its constants
        XCTAssertEqual(service?.apiKey, "6069da7b8a6af285c726f3add56ea305")
        XCTAssertEqual(service?.baseURL, "https://www.food2fork.com/api/search?key=6069da7b8a6af285c726f3add56ea305")
    }
    
    func testRecipeFetch() {
        // Test fetch
        let expectation = XCTestExpectation(description: "Wait for data being fetch")
        var apiResponse: Any?
        var apiError: Any?
        service?.fetchRecipes(callback: { (response, error) in
            expectation.fulfill()
            apiError = error
            apiResponse = response
        })
        wait(for: [expectation], timeout: 3.0) //wait 3 seconds for timeout
        XCTAssertNotNil(apiResponse)
        XCTAssertNil(apiError)
        XCTAssertTrue(apiResponse is [Recipe])
    }
}
