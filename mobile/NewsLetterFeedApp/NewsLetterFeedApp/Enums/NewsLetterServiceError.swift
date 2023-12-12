//
//  NewsLetterServiceError.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

enum NewsLetterServiceError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case dataParsingError
    case requestFailed(statusCode: Int)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "URL inválida."
        case .networkError(let underlyingError):
            return "Erro de rede: \(underlyingError.localizedDescription)"
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .dataParsingError:
            return "Erro ao analisar os dados da resposta."
        case .requestFailed(let statusCode):
            return "A requisição falhou com o código de status \(statusCode)."
        }
    }
}
