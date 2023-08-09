//
//  QiitaError.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import Foundation

enum QiitaError: Error {
    case invalidURLError
    case networkError
    case noneValueError
    case unknownError
    
    var title: String {
        switch self {
        case .invalidURLError:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        case .noneValueError:
            return "空の値のエラー"
        default:
            return "不明なエラー"
        }
    }
}
