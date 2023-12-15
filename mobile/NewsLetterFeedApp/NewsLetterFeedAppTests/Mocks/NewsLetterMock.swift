//
//  NewsLetterMock.swift
//  NewsLetterFeedAppTests
//
//  Created by Matheus Henrique Mendes Alexandre on 15/12/23.
//

import Foundation

struct MockNewsLetter {
    static func generateMockNewsLetter() -> NewsLetter {
        let contentLabel = ContentLabel(label: "Breaking News")
        let imageSizes = ImageSizes(L: ImgProperties(height: 400, url: "https://example.com/image.jpg", widt: 600))
        let sizes = Sizes(sizes: imageSizes)
        let newsLetterContent = NewsLetterContent(chapeu: contentLabel, image: sizes, summary: "This is a summary", title: "Exciting News", url: "https://example.com/news/1")
        
        return NewsLetter(id: "1", type: "materia", content: newsLetterContent, metadata: "2023-01-01")
    }
}
