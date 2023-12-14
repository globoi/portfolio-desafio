//
//  ContentView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: NewsLetterModel
    var body: some View {
        VStack {
            List {
                ForEach(model.newsLetter) { news in
                        HStack {
                            VStack(alignment: .leading) {
                                NewsComponentView(chapeu: news.content?.chapeu?.label ?? "", title: news.content?.title ?? "", imageURL: news.content?.image?.sizes.L.url, metadata: news.metadata ?? "", summary: news.content?.summary ?? "")
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                }
            }.task {
                do {
                    try await model.getG1Feed()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
