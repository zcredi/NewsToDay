//
//  NewsData.swift
//  NewsToDay
//
//  Created by Владислав on 14.05.2023.
//

import Foundation

// MARK: - Welcome
struct ArticleData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Resource
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var category: String?
}

// MARK: - Source
struct Resource: Codable {
    let id: String?
    let name: String?
}
