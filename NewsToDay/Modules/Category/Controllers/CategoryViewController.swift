//
//  CategoryViewController.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    enum Constants {
        static let categoriesLabelTopSpacing: CGFloat = 22.0
        static let categoriesLabelSideSpacing: CGFloat = 20.0
        static let descriptionLabelTopSpacing: CGFloat = 8.0
        static let descriptionLabelSideSpacing: CGFloat = 20.0
        static let categoryViewTopSpacing: CGFloat = 32.0
        static let categoryViewLeadingSpacing: CGFloat = 20.0
        static let categoryViewHeightSpacing: CGFloat = 70.0
        static let categoryViewSideSpacing: CGFloat = 0.0
    }
    
    //MARK: - Create UI
    
    private lazy var categoriesLabel = UILabel(text: "Categories", font: .interSemiBold24(), textColor: .blackPrimary)
    
    private lazy var descriptionLabel = UILabel(text: "Thousands of articles in each category", font: .interRegular16(), textColor: .greyPrimary)
    
    private let categoryView = CategoryView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(categoriesLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(categoryView)
    }
}

//MARK: - setConstraints()

extension CategoryViewController {
    private func setConstraints() {
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.categoriesLabelTopSpacing),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.categoriesLabelSideSpacing),
            categoriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.categoriesLabelSideSpacing)
        ])
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: Constants.descriptionLabelTopSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.descriptionLabelSideSpacing),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.descriptionLabelSideSpacing)
        ])
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.categoryViewTopSpacing),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.categoryViewSideSpacing),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.categoryViewSideSpacing),
            categoryView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: Constants.categoryViewHeightSpacing),
        ])
    }
}
