//
//  MenuView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 11/12/23.
//

import SwiftUI

struct MenuView: View {
    let menuItems: [MenuItem]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                List(menuItems) { menuItem in
                    NavigationLink(destination: WebViewComponent(urlString: menuItem.url)) {
                        Text(menuItem.title)
                            .foregroundColor(Color.fromHex(Constants.backgroundColor))
                            .bold()
                    }
                }
                .listStyle(PlainListStyle())
                Spacer()
            }
        }
    }
}

