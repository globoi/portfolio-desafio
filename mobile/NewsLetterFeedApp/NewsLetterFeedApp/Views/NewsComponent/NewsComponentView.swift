//
//  NewsComponentView.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 12/12/23.
//

import SwiftUI

struct NewsComponentView: View {
    var chapeu: String
    var title: String
    var imageURL: URL
    var metadata: String
    var summary: String

    var body: some View {
        VStack {
            Text(chapeu)
                .font(.caption)
                .padding()

            Text(title)
                .font(.title2)
                .padding(.bottom)

            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                @unknown default:
                    fatalError()
                }
            }
            .padding()

            Text(metadata)
                .font(.caption)
                .padding()

            Text(summary)
                .font(.body)
                .padding()
            
            Spacer()
        }
    }
}
