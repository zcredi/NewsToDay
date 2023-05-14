//
//  NewsData.swift
//  NewsToDay
//
//  Created by Владислав on 14.05.2023.
//

import Foundation

struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let resource: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Resource: Codable {
    let id: String?
    let name: String
}
