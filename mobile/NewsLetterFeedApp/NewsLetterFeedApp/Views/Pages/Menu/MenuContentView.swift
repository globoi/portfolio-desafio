//
//  MenuContentView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI

struct MenuContentView: View {
    var body: some View {
        let menuItems = Menu.menuItems

        return MenuView(menuItems: menuItems)
    }
}
