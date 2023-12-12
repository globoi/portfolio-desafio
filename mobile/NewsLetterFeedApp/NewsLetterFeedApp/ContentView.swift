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
                            Text(news.content?.title ?? "")
                            Text(news.content?.summary ?? "")
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
