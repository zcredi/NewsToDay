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
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.searchTextField.font = UIFont.interMedium16()
        view.searchBarStyle = .minimal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCategoriesCollection()
        setupUI()

        let testNews1 = Result(title: "News 1", category: "Category 1", imageURL: "333")
        let testNews2 = Result(title: "News 2", category: "Category 2", imageURL: "333")
        let testNews3 = Result(title: "News 3", category: "Category 3", imageURL: "333")
        middleCollectionView.news = [testNews1, testNews2, testNews3]
    }
    
    private func setupCategoriesCollection() {
        categoriesCollection.delegateCollectionDidSelect = self
        categoriesCollection.translatesAutoresizingMaskIntoConstraints = false
        middleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recommendedTableView.translatesAutoresizingMaskIntoConstraints = false
        recommendedView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(searchBar)
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
        // Handle category selection
    }
}




