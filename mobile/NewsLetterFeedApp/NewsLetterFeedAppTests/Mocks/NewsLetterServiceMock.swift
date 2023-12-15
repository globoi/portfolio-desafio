//
//  ServiceMock.swift
//  NewsLetterFeedAppTests
//
//  Created by Matheus Henrique Mendes Alexandre on 15/12/23.
//

import Foundation
@testable import NewsLetterFeedApp

class NewsLetterServiceMock: NewsLetterServiceProtocol {
    var mockData: [NewsLetter]?
    var mockError: Error?
    private var fetchDataCallCount = 0
    var fetchDataResult: Result<NewsLetterResponse, Error> = .success(NewsLetterResponse(feed: nil))

    
    init(mockData: [NewsLetter]? = nil, mockError: Error? = nil) {
        self.mockData = mockData
        self.mockError = mockError
    }
    
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        if let mockError = mockError {
            throw mockError
        }
        
        self.fetchDataCallCount += 1
        
        guard let data = try? JSONEncoder().encode(fetchDataResult.get()) else {
            throw NewsLetterServiceError.dataParsingError
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func getFetchDataCallCount() -> Int {
        return fetchDataCallCount
        
    }
    
}

enum SomeErrorType: Error {
    case invalidType
}
