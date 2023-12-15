//
//  NewsLetterModelTests.swift
//  NewsLetterFeedAppTests
//
//  Created by Matheus Henrique Mendes Alexandre on 15/12/23.
//

import XCTest
@testable import NewsLetterFeedApp

import XCTest
@testable import NewsLetterFeedApp

class NewsLetterModelTests: XCTestCase {
    
    func testGetG1FeedSuccess() async throws {
        // Given
        let mockService = NewsLetterServiceMock()
        let mockModel = await NewsLetterModel(newsLetterService: mockService)

        // Set the result you want for testing
        mockService.fetchDataResult = .success(NewsLetterResponse(feed: Feed(falkor: Falkor(items: []))))

        // When
        try await mockModel.getG1Feed()

        // Then
        
        XCTAssertEqual(mockService.getFetchDataCallCount(), 1, "Expected fetchData to be called ones.")
        
    }

    func testGetG1FeedFailure() async throws {
        // Given
        let mockService = NewsLetterServiceMock()
        let mockModel = await NewsLetterModel(newsLetterService: mockService)

        // Set the result you want for testing
        mockService.fetchDataResult = .failure(NewsLetterServiceError.invalidResponse)

        // When
        do {
            try await mockModel.getG1Feed()
            XCTFail("Expected an error to be thrown, but no error was thrown.")
        } catch {
            // Then
            XCTAssertTrue(error is NewsLetterServiceError, "Expected a NewsLetterServiceError, but received \(type(of: error))")
        }
    }
}
