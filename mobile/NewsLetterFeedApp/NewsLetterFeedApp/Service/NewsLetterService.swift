//
//  Service.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

protocol NewsLetterServiceProtocol {
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T
}

class NewsLetterService: NewsLetterServiceProtocol {
    private let cache = NSCache<NSURL, NSData>()

    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NewsLetterServiceError.invalidURL
        }

        if let cachedData = cache.object(forKey: url as NSURL) as Data? {
            do {
                return try JSONDecoder().decode(T.self, from: cachedData)
            } catch {
                print("Error decoding cached data: \(error)")
            }
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            try saveDataToCache(data, for: url)

            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error fetching data: \(error)")
            throw NewsLetterServiceError.requestFailed(underlyingError: error)
        }
    }

    private func saveDataToCache(_ data: Data, for url: URL) throws {
        cache.setObject(data as NSData, forKey: url as NSURL)
    }
}

