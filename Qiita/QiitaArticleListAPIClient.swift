//
//  QiitaArticleListAPIClient.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import Foundation

class QiitaArticleListAPIClient: QiitaArticleListAPIClientProtocol {
    func fetch(completion: @escaping ((Swift.Result<[QiitaArticle], QiitaError>) -> Void)) {
        
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            return completion(.failure(.invalidURLError))
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { ( data, response, error ) in
            
            do {
                guard let data = data else { throw QiitaError.networkError }
                let decoder = JSONDecoder()
                guard let articleList = try? decoder.decode([QiitaArticle].self, from: data) else {
                    throw QiitaError.noneValueError
                }
                DispatchQueue.main.async {
                    completion(.success(articleList))
                }
//                catch 処理がなければ以下のエラー
//                Invalid conversion from throwing function of type '@Sendable 
            } catch {
                if error as? QiitaError == QiitaError.networkError {
                    completion(.failure(.networkError))
                } else if error as? QiitaError == QiitaError.noneValueError {
                    completion(.failure(.noneValueError))
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }.resume()
    }
}
