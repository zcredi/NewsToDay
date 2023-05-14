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
        static let countryURL = "country=us"
        static let apiKey = "60dd4d0628da48878cad3163d8a74512"
    }
    
    func getCategory(completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/\(Constants.sources)&apiKey=\(Constants.apiKey)") else { return }
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
    
    func getNews() {
        guard let url = URL(string: "\(Constants.baseURL)?\(Constants.countryURL)&apiKey=\(Constants.apiKey)") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let article = try? JSONDecoder().decode(Article.self, from: data) {
                print(article.author as Any)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}
