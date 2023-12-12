//
//  NewsLetterFeedAppApp.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 11/12/23.
//

import SwiftUI

@main
struct NewsLetterFeedAppApp: App {
    private var service = NewsLetterService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NewsLetterModel(newsLetterService: service))
        }
    }
}
