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

    @State private var isLoading: Bool = true

    var body: some View {
        ZStack {
            if let url = URL(string: urlString ?? "") {
                WebView(url: url, isLoading: $isLoading)
            }

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.5)
            }
        }
        .onAppear {
            isLoading = true
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var isLoading: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
    }
}
