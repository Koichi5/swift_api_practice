//
//  QiitaContentView.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import SwiftUI

struct QiitaContentView: View {
    @ObservedObject private var viewModel = QiitaArticleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<viewModel.articles.count, id: \.self) { index in
                        NavigationLink (destination: QiitaDetailView(
                            title: viewModel.articles[index].title,
                            createdAt: viewModel.articles[index].created_at,
                            likesCount: viewModel.articles[index].likes_count,
                            stockesCount: viewModel.articles[index].stocks_count,
                            pageViewCount: viewModel.articles[index].page_views_count ?? 0,
                            bodyContent: viewModel.articles[index].body.getAttributedString(),
                            url: viewModel.articles[index].url
                        )) {
                            VStack (alignment: .leading){
                                Text(viewModel.articles[index].title)
                                    .font(.headline)
                                Text(viewModel.articles[index].created_at)
                                    .foregroundColor(Color.gray)
                                    .font(.caption)
                                HStack {
                                    HStack {
                                        Image(systemName: "heart")
                                        Text("\(viewModel.articles[index].likes_count)")
                                    }
                                    .padding(.trailing)
                                    HStack {
                                        Image(systemName: "square.and.arrow.down")
                                        Text("\(viewModel.articles[index].stocks_count)")
                                    }
                                    .padding(.trailing)
                                    HStack {
                                        Image(systemName: "eye")
                                        Text("\(viewModel.articles[index].page_views_count ?? 0)")
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.top)
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("最新記事")
        }
    }
}

// markdown extension
extension String {
    func getAttributedString() -> AttributedString {
        do {
            let attributedString = try AttributedString(markdown: self)
            return attributedString
        } catch {
            print("Couldn't parse: \(error)")
        }
        return AttributedString("Error parsing markdown")
    }
}

struct QiitaContentView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaContentView()
    }
}
