//
//  FetchImageModelTests.swift
//  WWDCConcurrencyTests
//
//  Created by mk on 12/15/23.
//

import XCTest
@testable import WWDCConcurrency

class FetchImageModelTests: XCTestCase {
	
	func testFetchThumbnailsUsingExpectation() async throws {
		let expectation = XCTestExpectation(description: "mock thumbnails completion")
		
		let model = FetchImageModel()
		let url = "https://picsum.photos/400"
		let result = try await model.fetchThumbnail(url: url)
		XCTAssertNoThrow(result)
		
		expectation.fulfill()
		wait(for: [expectation], timeout: 5.0)
	}
	
	func testFetchThumbnails() async throws {
		let model = FetchImageModel()
		let url = "https://picsum.photos/400"
		let result = try await model.fetchThumbnail(url: url)
		XCTAssertNoThrow(result)
	}
}
