//
//  NewsLetterResponse.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

struct NewsLetterResponse: Decodable, Hashable, Encodable {
    var feed: Feed?
}

struct Feed: Decodable, Hashable, Encodable {
    var falkor: Falkor?
}

struct Falkor: Decodable, Hashable, Encodable {
    var items: [NewsLetter]?
}

struct NewsLetter: Decodable, Identifiable, Hashable, Encodable {
    var id: String?
    var type: String?
    var content: NewsLetterContent?
    var metadata: String?
}

struct NewsLetterContent: Decodable, Hashable, Encodable {
    var chapeu: ContentLabel?
    var image: Sizes?
    var summary: String?
    var title: String?
    var url: String?
}

struct ContentLabel: Decodable, Hashable, Encodable {
    var label: String?
}

struct Sizes: Decodable, Hashable, Encodable {
    var sizes: ImageSizes
}

struct ImageSizes: Decodable, Hashable, Encodable {
    var L: ImgProperties
}

struct ImgProperties: Decodable, Hashable, Encodable {
    var height: Int?
    var url: String?
    var widt: Int?
}
