//
//  NewsLetterServiceError.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

enum NewsLetterServiceError: Error {
    case invalidURL
    case invalidResponse
    case dataParsingError
    case requestFailed(underlyingError: Error)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return Constants.invalidURL
        case .invalidResponse:
            return Constants.invalidResponse
        case .dataParsingError:
            return Constants.dataParsingError
        case .requestFailed(let underlyingError):
            return "\(Constants.requestFailed) \(underlyingError.localizedDescription)"
        }
    }
}
