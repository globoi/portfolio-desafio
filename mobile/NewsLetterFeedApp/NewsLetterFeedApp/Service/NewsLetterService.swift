//
//  Service.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

class NewsLetterService {        
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NewsLetterServiceError.invalidURL
        }

        do {
             let (data, _) = try await URLSession.shared.data(from: url)
             return try JSONDecoder().decode(T.self, from: data)
         } catch {
             print(error)
             throw NewsLetterServiceError.requestFailed(underlyingError: error)
         }
    }
}
