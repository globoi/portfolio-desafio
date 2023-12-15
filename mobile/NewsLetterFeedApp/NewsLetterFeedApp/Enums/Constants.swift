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
    static let backgroundColor = "C4170C"
    static let lightGray = ""

    static func getFullStringPath(forPath path: String) -> String {
        return "\(baseURL)\(path)"
    }
}

