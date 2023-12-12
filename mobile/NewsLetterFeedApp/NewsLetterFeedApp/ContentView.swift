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
                    if let stringUrl = news.content?.image?.url,
                       let imageURL = URL(string: stringUrl){
                        HStack {
                            VStack(alignment: .leading) {
                                NewsComponentView(chapeu: news.content?.chapeu?.label ?? "", title: news.content?.title ?? "", imageURL: imageURL, metadata: news.metadata ?? "", summary: news.content?.summary ?? "")
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
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
