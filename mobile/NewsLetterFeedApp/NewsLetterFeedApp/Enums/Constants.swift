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

    static func fullURL(forPath path: String) -> URL? {
        return URL(string: "\(baseURL)\(path)")
    }
}

