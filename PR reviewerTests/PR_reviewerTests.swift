//
//  PR_reviewerTests.swift
//  PR reviewerTests
//
//  Created by Faizan Memon on 05/10/22.
//

import XCTest
@testable import PR_reviewer

class PR_reviewerTests: XCTestCase {

    private var viewModel: PRReviewViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = PRReviewViewModel(gitService: GitService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testFetchPRsWhenDataSourceIsEmpty() {
        let expectation = self.expectation(
            description: "fetch_pr_method_when_empty_datasource"
        )
        viewModel?.dataSource = []
        viewModel?.fetchPRsIfPossible(completionHandler: { newItems, index in
            XCTAssertTrue(newItems.count != 0, "new items fetched shouldn't be empty")
            XCTAssert(index == 0, "index to insert should be zero when datasource is empty")
            expectation.fulfill()
        }, errorHandler: {})
        
        waitForExpectations(timeout: 30)
    }

    func testFetchPRsWhenDataSourceIsNotEmpty() {
        let expectation = self.expectation(
            description: "fetch_pr_method_when_non_empty_datasource"
        )
        
        let data = UnitTestHelper.shared.getDataFromMockResponse(
            fileName: MockFiles.prItem.rawValue
        )
        
        if let prItem = try? JSONDecoder().decode(PRItem.self, from: data) {
            viewModel?.dataSource = [ prItem ]
        }

        viewModel?.fetchPRsIfPossible(completionHandler: { newItems, index in
            XCTAssertTrue(newItems.count != 0, "new items fetched shouldn't be empty")
            XCTAssertTrue(index == 1, "index to insert should be one when datasource has one value")
            expectation.fulfill()
        }, errorHandler: {})

        waitForExpectations(timeout: 30)
    }
}
