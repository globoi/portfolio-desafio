//
//  WebViewComponent.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI
import WebKit

struct WebViewComponent: View {
    let urlString: String?

    var body: some View {
        if let url = URL(string: urlString ?? "") {
            WebView(url: url)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
