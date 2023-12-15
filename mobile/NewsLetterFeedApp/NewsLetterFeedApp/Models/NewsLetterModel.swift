//
//  NewsLetterModel.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

protocol NewsLetterModelProtocol {
    var newsLetter: [NewsLetter] { get }
    func getG1Feed() async throws
    func getAgroFeed() async throws
}

@MainActor
class NewsLetterModel: ObservableObject {
    
    @Published var newsLetter: [NewsLetter] = []

    let newsLetterService: NewsLetterServiceProtocol
    
    init(newsLetterService: NewsLetterServiceProtocol) {
        self.newsLetterService = newsLetterService
    }
    
    func getG1Feed() async throws {
        let response: NewsLetterResponse = try await newsLetterService.fetchData(from: "\(Constants.baseURL)\(Constants.g1FeedPath)")
        
        if let items = response.feed?.falkor?.items {
            self.newsLetter = filterNewsLettersByType(items)
        }
    }
    
    func getAgroFeed() async throws {
        let response: NewsLetterResponse = try await newsLetterService.fetchData(from: "\(Constants.baseURL)\(Constants.agroFeedPath)")
        
        if let items = response.feed?.falkor?.items {
            self.newsLetter = filterNewsLettersByType(items)
        }
    }
    
    private func filterNewsLettersByType(_ newsletters: [NewsLetter]) -> [NewsLetter] {
        let allowedTypes: Set<String> = ["materia", "basico"]

        return newsletters.filter { newsLetter in
            if let type = newsLetter.type, allowedTypes.contains(type) {
                return true
            }
            return false
        }
    }
}
