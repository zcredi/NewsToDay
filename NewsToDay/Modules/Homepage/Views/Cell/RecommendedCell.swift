//
//  RecommendedCell.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

class RecommendedCell: UITableViewCell {
    
    static let identifier = "RecommendedCell"
    
    var liked: Bool = false
    
    private let newsImageView = UIImageView()
    private let newsTitleLabel = UILabel()
    private let categoryLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ article: Result) {
        self.newsTitleLabel.text = article.title
        self.categoryLabel.text = article.category
        if let imageURL = article.imageURL, let url = URL(string: imageURL) {
            let data = try? Data(contentsOf: url)
            self.newsImageView.image = UIImage(data: data ?? Data())
        } else {
            self.newsImageView.image = UIImage(named: "NoImage")
        }
    }
    
    private func configureNewsImageView() {
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.image = UIImage(named: "333")
        newsImageView.contentScaleFactor = 1.0
        newsImageView.layer.cornerRadius = 20
        newsImageView.layer.masksToBounds = true
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTitleLabel() {
        newsTitleLabel.text = "The latest situation in the presedential election"
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.textAlignment = .left
        newsTitleLabel.font = UIFont.interSemiBold16()
        newsTitleLabel.textColor = .blackPrimary
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCategoryLabel() {
        categoryLabel.text = "Without category"
        categoryLabel.textAlignment = .left
        categoryLabel.font = UIFont.interRegular14()
        categoryLabel.textColor = .greyPrimary
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Set constraints and add Subview
extension RecommendedCell {
    
    func setupView() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(categoryLabel)
        configureNewsImageView()
        configureTitleLabel()
        configureCategoryLabel()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsImageView.widthAnchor.constraint(equalToConstant: 90),
            newsImageView.heightAnchor.constraint(equalToConstant: 90),
            
            
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,constant: 15),
            newsTitleLabel.centerYAnchor.constraint(equalTo: newsImageView.centerYAnchor),
            
            categoryLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: newsTitleLabel.topAnchor, constant: -5),

        ])
    }
}
