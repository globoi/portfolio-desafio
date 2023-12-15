//
//  NewsListView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI

struct NewsListView: View {
    @Binding var selectedNews: NewsLetter?
    var news: [NewsLetter]

    var body: some View {
        List {
            ForEach(news) { newsItem in
                NavigationLink(destination: WebViewComponent(urlString: newsItem.content?.url ?? ""),
                               tag: newsItem,
                               selection: $selectedNews) {
                    HStack {
                        VStack(alignment: .leading) {
                            NewsComponentView(chapeu: newsItem.content?.chapeu?.label ?? "",
                                              title: newsItem.content?.title ?? "",
                                              imageURL: newsItem.content?.image?.sizes.L.url,
                                              metadata: newsItem.metadata ?? "",
                                              summary: newsItem.content?.summary ?? "")
                        }
                        Spacer()
                    }
                    .contentShape(Rectangle())
                }
                .onTapGesture {
                    selectedNews = newsItem
                }
            }
        }
    }
}
