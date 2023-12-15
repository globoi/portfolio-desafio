//
//  WebViewContainer.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI

struct WebViewContainer: View {
    let url: String

    var body: some View {
        NavigationView {
            WebViewComponent(urlString: url)
                .navigationTitle("Web View")
        }
    }
}
