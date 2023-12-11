//
//  ContentView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            AgroView()
                .tabItem { Label("Agro", systemImage: "leaf") }
            MenuView()
                .tabItem { Label("Opções", systemImage: "menucard") }
        }
    }
}

#Preview {
    ContentView()
}
