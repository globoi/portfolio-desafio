//
//  View+Extension.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI

extension View {
    func customNavigationBar(title: String, backgroundColor: Color, titleColor: Color) -> some View {
        CustomNavigationView(content: { self }, title: title, backgroundColor: backgroundColor, titleColor: titleColor)
    }
}
