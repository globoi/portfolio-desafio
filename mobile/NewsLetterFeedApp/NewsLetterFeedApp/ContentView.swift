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
                .tabItem { Label(Constants.homeTabItem, systemImage: Constants.homeImage)}
            AgroView()
                .tabItem { Label(Constants.agroTabItem, systemImage: Constants.agroImage) }
            MenuView(menuItems: Menu.menuItems)
                .tabItem { Label(Constants.menuTabItem, systemImage: Constants.menuImage) }
        }
        .tint(Color.fromHex(Constants.backgroundColor))
    }
}

#Preview {
    ContentView()
}
