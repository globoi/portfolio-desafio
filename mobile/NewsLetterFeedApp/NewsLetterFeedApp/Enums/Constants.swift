//
//  Constants.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

enum Constants {
    static let baseURL = "https://native-leon.globo.com"
    static let g1FeedPath = "/feed/g1"
    static let agroFeedPath = "/feed/https://g1.globo.com/economia/agronegocios"
    static let invalidURL = "URL inválida."
    static let invalidResponse = "Resposta inválida do servidor."
    static let dataParsingError = "Erro ao analisar os dados da resposta."
    static let requestFailed = "Erro na requisição:"
    static let agroTabItem = "Agro"
    static let homeTabItem = "Home"
    static let menuTabItem = "Menu"
    static let agroImage = "leaf.fill"
    static let homeImage = "house.fill"
    static let menuImage = "menucard.fill"
    static let navBarTitle = "G1"

    static func getFullStringPath(forPath path: String) -> String {
        return "\(baseURL)\(path)"
    }
}

