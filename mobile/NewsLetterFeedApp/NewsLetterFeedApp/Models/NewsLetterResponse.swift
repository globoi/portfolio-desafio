//
//  NewsLetterResponse.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

struct NewsLetterResponse: Decodable, Hashable {
    var feed: Feed?
}

struct Feed: Decodable, Hashable {
    var falkor: Falkor?
}

struct Falkor: Decodable, Hashable {
    var items: [NewsLetter]?
}

struct NewsLetter: Decodable, Identifiable, Hashable {
    var id: String?
    var type: String?
    var content: NewsLetterContent?
    var metadata: String?
}

struct NewsLetterContent: Decodable, Hashable {
    var chapeu: ContentLabel?
    var image: Sizes?
    var summary: String?
    var title: String?
    var url: String?
}

struct ContentLabel: Decodable, Hashable {
    var label: String?
}

struct Sizes: Decodable, Hashable {
    var sizes: ImageSizes
}

struct ImageSizes: Decodable, Hashable {
    var L: ImgProperties
}

struct ImgProperties: Decodable, Hashable {
    var height: Int?
    var url: String?
    var widt: Int?
}
