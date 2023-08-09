//
//  QiitaArticleViewModel.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import Foundation

final class QiitaArticleViewModel: ObservableObject {
    @Published var articles: [QiitaArticle] = [QiitaArticle]()
    private let articleListAPIClient = QiitaArticleListAPIClient()
    
    init() {
        loadArticles()
    }
    
    private func loadArticles() {
        print("article loding fired")
        articleListAPIClient.fetch(completion: { result in
            switch result {
            case .success(let articleList):
                self.articles = articleList
            case .failure(let error):
                print(error.title)
            }
        })
    }
}
