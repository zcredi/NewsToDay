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
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=60dd4d0628da48878cad3163d8a74512") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            if let article = try? JSONDecoder().decode(Welcome.self, from: data) {
                print(article.totalResults)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print("Failed to decode JSON data: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
