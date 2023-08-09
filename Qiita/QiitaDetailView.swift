//
//  QiitaDetailView.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import SwiftUI

struct QiitaDetailView: View {
    let title: String
    let createdAt: String
    let likesCount: Int
    let stockesCount: Int
    let pageViewCount: Int
    let bodyContent: AttributedString
    let url: String
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    Text(createdAt)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding(.bottom)
                        .padding(.leading)
                    HStack (alignment: .firstTextBaseline) {
                        HStack {
                            Image(systemName: "heart")
                            Text("\(likesCount)")
                                .padding(.trailing)
                        }
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("\(stockesCount)")
                                .padding(.trailing)
                        }
                        HStack {
                            Image(systemName: "eye")
                            Text("\(pageViewCount)")
                                .padding(.trailing)
                        }
                    }
                    .padding(.bottom)
                    .padding(.leading)
                    Text(bodyContent)
                        .padding(.bottom)
                        .padding(.leading)
                    Text(url)
                        .padding(.leading)
                        .padding(.bottom)
                }
            }
            .navigationTitle(title)
        }
    }
}

//
//struct QiitaDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        QiitaDetailView()
//    }
//}
