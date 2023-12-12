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
            return "URL inválida."
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .dataParsingError:
            return "Erro ao analisar os dados da resposta."
        case .requestFailed(let underlyingError):
            return "Erro na requisição: \(underlyingError.localizedDescription)"
        }
    }
}
