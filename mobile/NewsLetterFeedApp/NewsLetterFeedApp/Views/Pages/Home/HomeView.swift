//
//  HomeView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var model: NewsLetterModel
    @State private var selectedNews: NewsLetter?
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(model.newsLetter) { news in
                        NavigationLink(destination: WebViewComponent(urlString: news.content?.url ?? ""),
                                       tag: news,
                                       selection: $selectedNews) {
                            HStack {
                                VStack(alignment: .leading) {
                                    NewsComponentView(chapeu: news.content?.chapeu?.label ?? "",
                                                      title: news.content?.title ?? "",
                                                      imageURL: news.content?.image?.sizes.L.url,
                                                      metadata: news.metadata ?? "",
                                                      summary: news.content?.summary ?? "")
                                }
                                Spacer()
                            }
                            .contentShape(Rectangle())
                        }
                        .onTapGesture {
                            selectedNews = news
                        }
                    }
                }
                .task {
                    do {
                        try await model.getG1Feed()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .customNavigationBar(title: "G1", backgroundColor: Color.fromHex(Constants.backgroundColor), titleColor: .white)
            }
        }
    }
}

