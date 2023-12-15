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
                NewsListView(selectedNews: $selectedNews, news: model.newsLetter)
                    .refreshable {
                        do {
                            try await model.getG1Feed()
                        } catch {
                            print(error.localizedDescription)
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
