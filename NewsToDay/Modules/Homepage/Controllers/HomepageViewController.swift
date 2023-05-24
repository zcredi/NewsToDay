//
//  HomepageViewController.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

class HomepageViewController: UIViewController, CollectionDidSelectProtocol {
    
    
    private var categoriesCollection = CategoriesCollectionView()
    private var middleCollectionView = NewsCollectionView()
    private var recommendedTableView = RecommendedTableView()
    private var recommendedView = RecommendedView()
    
    var searchTableView = UITableView()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Browse"
        view.textAlignment = .left
        view.font = UIFont.interSemiBold24()
        view.textColor = .blackPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Discover things of this world"
        view.textAlignment = .left
        view.font = UIFont.interRegular16()
        view.textColor = .greyPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.searchTextField.font = UIFont.interMedium16()
        view.searchBarStyle = .minimal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCategoriesCollection()
        setupUI()
        configureTable()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        getNewsFromCategory(categoryName: Category.allCases.randomElement()?.rawValue ?? "")
    }
    
    private func setupCategoriesCollection() {
        categoriesCollection.delegateCollectionDidSelect = self
        middleCollectionView.delegateNewsCollectionView = self
        recommendedTableView.delegateRecommendedTableView = self
        
        searchBar.delegate = middleCollectionView
        
        let vc = tabBarController?.viewControllers?.first(where: { $0 is CategoryViewController }) as? CategoryViewController
        vc?.delegateCategory = self
        categoriesCollection.translatesAutoresizingMaskIntoConstraints = false
        middleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recommendedTableView.translatesAutoresizingMaskIntoConstraints = false
        recommendedView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTable() {
        searchTableView.rowHeight = 100
        searchTableView.separatorStyle = .none
        searchTableView.backgroundColor = .clear
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
//        searchTableView.dataSource = self
//        searchTableView.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(searchBar)
        view.addSubview(searchTableView)
        view.addSubview(categoriesCollection)
        view.addSubview(middleCollectionView)
        view.addSubview(recommendedTableView)
        view.addSubview(recommendedView)
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            categoriesCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 25),
            categoriesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollection.heightAnchor.constraint(equalToConstant: 35),
            
            middleCollectionView.topAnchor.constraint(equalTo: categoriesCollection.bottomAnchor, constant: 25),
            middleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            recommendedView.topAnchor.constraint(equalTo: middleCollectionView.bottomAnchor, constant: 50),
            recommendedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recommendedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            recommendedTableView.topAnchor.constraint(equalTo: recommendedView.bottomAnchor),
            recommendedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recommendedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recommendedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func getNewsFromCategory(categoryName: String) {
        
        var resultCategory = ""
        
        switch categoryName {
        case "general":
            resultCategory = "🔥 General"
        case "health":
            resultCategory = "🫀 Health"
        case "business":
            resultCategory = "💼 Business"
        case "technology":
            resultCategory = "👨‍💻 Technology"
        case "science":
            resultCategory = "🔬 Science"
        case "entertainment":
            resultCategory = "🎮 Gaming"
        case "sports":
            resultCategory = "🏈 Sports"
        default:
            break
        }
        
        let category = resultCategory
        
        APIManager.shared.getAll(category: categoryName) { articles in
            var result = [Result]()
            articles.forEach { article in
                let resultItem = Result(title: article.title, category: category, imageURL: article.urlToImage, description: article.description, author: article.author)
                
                result.append(resultItem)
            }
            self.middleCollectionView.news = result
        }
    }
    
}

extension HomepageViewController: CategoryDidSelectProtocol {
    
    func switchCategories(_ category: String) -> String {
        var result = ""
        
        switch category {
        case "general":
            result = "🔥 General"
        case "health":
            result = "🫀 Health"
        case "business":
            result = "💼 Business"
        case "technology":
            result = "👨‍💻 Technology"
        case "science":
            result = "🔬 Science"
        case "entertainment":
            result = "🎮 Gaming"
        case "sports":
            result = "🏈 Sports"
        default: break
        }
        
        return result
    }
    
    func getRecommendCategory(categoryName: [String]) {
        let categories = categoryName.map { switchCategories($0) }
        
        let categoryString = categories.joined(separator: ", ")
        
        APIManager.shared.getFull(categories: categoryName) { articles in
            var recommend = [Recommend]()
            articles.forEach { article in
                let recommendItem = Recommend(title: article.title, category: categoryString, imageURL: article.urlToImage, description: article.description, author: article.author)
                recommend.append(recommendItem)
            }
            self.recommendedTableView.recommendNews = recommend
        }
    }
}

extension HomepageViewController: NewsCollectionViewDelegate {
    func newsDidSelectItemDelegate(newsItem: Result) {
        let vc = ArticlePageViewController()
        vc.setupData(newsItem: newsItem)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension HomepageViewController: RecommendedTableViewDelegate {
    
    func recommendDidSelectItemDelegate(recommendNews: Recommend) {
        let vc = ArticlePageViewController()
        vc.setupDataRecommend(recommendNews: recommendNews)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

//extension HomepageViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
//            return UITableViewCell()
//        }
//
//        return cell
//    }
//}
