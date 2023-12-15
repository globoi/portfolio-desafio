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
                .tabItem { Label("Home", systemImage: "house.fill")}
            AgroView()
                .tabItem { Label("Agro", systemImage: "leaf.fill") }
            MenuView(menuItems: Menu.menuItems)
                .tabItem { Label("Home", systemImage: "menucard.fill") }
        }
        .tint(Color.fromHex(Constants.backgroundColor))
    }
}

#Preview {
    ContentView()
}
