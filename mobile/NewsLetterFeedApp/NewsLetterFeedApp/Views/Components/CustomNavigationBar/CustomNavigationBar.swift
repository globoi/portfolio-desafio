//
//  CustomNavigationBar.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    let content: Content
    let title: String
    let backgroundColor: Color
    let titleColor: Color

    init(@ViewBuilder content: () -> Content, title: String, backgroundColor: Color, titleColor: Color) {
        self.content = content()
        self.title = title
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
    }

    var body: some View {
        ZStack(alignment: .top) {
            backgroundColor.edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.title2)
                        .foregroundColor(titleColor)
                        .bold()
                        .padding()
                    Spacer()
                }
                .background(backgroundColor)
                
                content
            }
        }
    }
}
