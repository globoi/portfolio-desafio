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
    @State private var isLoading: Bool = true

    var body: some View {
        ZStack {
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
            .opacity(isLoading ? 0 : 1)  // Oculta a lista enquanto está carregando
            .onAppear {
                // Simula um tempo de carregamento (substitua isso pelo código real de carregamento)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.5)
            }
        }
    }
}
