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
struct Article: Codable, Equatable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        return true
    }
    
    let source: Resource
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let videoURL: JSONNull?
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

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
