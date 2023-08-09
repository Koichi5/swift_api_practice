//
//  QiitaArticleListAPIClientProtocol.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import Foundation

protocol QiitaArticleListAPIClientProtocol {
    func fetch(completion: @escaping ((Swift.Result<[QiitaArticle], QiitaError>) -> Void))
}
