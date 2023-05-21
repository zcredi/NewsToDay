//
//  CategoryModel.swift
//  NewsToDay
//
//  Created by Владислав on 14.05.2023.
//

import Foundation

// MARK: - NewsData
struct CategoryModel: Codable {
    let sources: [Source]
}

// MARK: - Source
struct Source: Codable {
    let id: String
    let category: String
}

enum Category: String, Codable, CaseIterable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
