//
//  NewsLetterResponse.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import Foundation

struct NewsLetterResponse: Decodable {
    var feed: Feed?
}

struct Feed: Decodable {
    var falkor: Falkor?
}

struct Falkor: Decodable {
    var items: [NewsLetter]?
}

struct NewsLetter: Decodable, Identifiable {
    var id: String?
    var type: String?
    var content: NewsLetterContent?
    var metadata: String?
}

struct NewsLetterContent: Decodable {
    var chapeu: ContentLabel?
    var image: Sizes?
    var summary: String?
    var title: String?
    var url: String?
}

struct ContentLabel: Decodable {
    var label: String?
}

struct Sizes: Decodable {
    var sizes: ImageSizes
}

struct ImageSizes: Decodable {
    var L: ImgProperties
}

struct ImgProperties: Decodable {
    var height: Int?
    var url: String?
    var widt: Int?
}
