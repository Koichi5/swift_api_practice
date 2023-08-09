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
        VStack {
            List {
                ForEach(0..<viewModel.articles.count, id: \.self) { index in
                    VStack {
                        Text(viewModel.articles[index].title)
                        HStack {
                            Text("いいね数： \(viewModel.articles[index].likes_count)")
                            Text("ストック数： \(viewModel.articles[index].stocks_count)")
                            Text("閲覧数： \(viewModel.articles[index].page_views_count ?? 0)")
                        }
                        Text("URL： \(viewModel.articles[index].url)")
                    }
                }
            }
        }
    }
}

struct QiitaContentView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaContentView()
    }
}
