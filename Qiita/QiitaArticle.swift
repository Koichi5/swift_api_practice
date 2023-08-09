//
//  QiitaArticle.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import Foundation

struct QiitaArticle: Codable {
    let title: String
    let body: String
    let created_at: String
//    let tags: [String]?
//    let user: String
    let url: String
    let likes_count: Int
    let stocks_count: Int
    let page_views_count: Int?
}
