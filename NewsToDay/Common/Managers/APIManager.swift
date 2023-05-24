//
//  APIManager.swift
//  NewsToDay
//
//  Created by Владислав on 13.05.2023.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    enum Constants {
        static let baseURL = "https://newsapi.org/v2/top-headlines"
        static let sources = "sources?"
        static let category = "category="
        static let apiKey = "60dd4d0628da48878cad3163d8a74512"
    }
    
    enum Category: String, CaseIterable {
        case business = "business"
        case entertainment = "entertainment"
        case general = "general"
        case health = "health"
        case science = "science"
        case sports = "sports"
        case technology = "technology"
    }
    
    func getCategory(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/\(Constants.sources)&apiKey=\(Constants.apiKey)") else { return }
        print(url)
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let categoryModel = try? JSONDecoder().decode(CategoryModel.self, from: data) {
                let categories = categoryModel.sources.map { $0.category }
                let uniqueCategories = Set(categories)
                completion(Array(uniqueCategories))
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getNews(category: Category, completion: @escaping ([Article]) -> ()) {
            
            var urlComponent = URLComponents()
            urlComponent.scheme = "https"
            urlComponent.host = "newsapi.org"
            urlComponent.path = "/v2/top-headlines"
            
            urlComponent.queryItems = [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "category", value: "\(category.rawValue)"),
                URLQueryItem(name: "apiKey", value: "60dd4d0628da48878cad3163d8a74512"),
            ]
            
            if let url = urlComponent.url {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    if let safeData = data {
                        
                        do {
                            let newsResponse = try JSONDecoder().decode(ArticleData.self, from: safeData)
                           completion(newsResponse.articles)
                        } catch let error {
                            print(error.localizedDescription)
                            return
                        }
                    }
                }.resume()
            }
        }
//https://newsapi.org/v2/top-headlines?category=business&apiKey=60dd4d0628da48878cad3163d8a74512
    
    func getAll(category: String, completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)?\(Constants.category)\(category)&apiKey=\(Constants.apiKey)") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            guard let data else { return }
            if let articleData = try? JSONDecoder().decode(ArticleData.self, from: data) {
                completion(articleData.articles)
            } else {
                completion([])
            }
            
        }
        task.resume()
    }
    
    func getFull(categories: [String], completion: @escaping ([Article]) -> Void) {
        var newCategory = ""
        categories.forEach { category in
            newCategory.append("\(Constants.category)\(category)&")
        }
        guard let url = URL(string: "\(Constants.baseURL)?\(newCategory)apiKey=\(Constants.apiKey)") else { return }
        print(url)
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            guard let data else { return }
            if let articleData = try? JSONDecoder().decode(ArticleData.self, from: data) {
                completion(articleData.articles)
            } else {
                completion([])
            }
            
        }
        task.resume()
    }
}
