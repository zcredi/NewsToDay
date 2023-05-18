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
        
    func getNews(completion: @escaping ([Article]) -> ()) {
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "newsapi.org"
        urlComponent.path = "/v2/top-headlines"
        
        urlComponent.queryItems = [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "category", value: "business"),
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
                        let newsResponse = try JSONDecoder().decode(Welcome.self, from: safeData)
                       completion(newsResponse.articles)
                    } catch let error {
                        print(error.localizedDescription)
                        return
                    }
                }
            }.resume()
        }
    }
}
