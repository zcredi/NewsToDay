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
    
    func configureRecommendCell(_ newsRecommend: Recommend) {
        DispatchQueue.main.async {
            self.newsTitleLabel.text = newsRecommend.title
            self.categoryLabel.text = newsRecommend.category
            
            switch self.categoryLabel.text {
            case "general":
                self.categoryLabel.text = "🔥 General"
            case "health":
                self.categoryLabel.text = "🫀 Health"
            case "business":
                self.categoryLabel.text = "💼 Business"
            case "technology":
                self.categoryLabel.text = "👨‍💻 Technology"
            case "science":
                self.categoryLabel.text = "🔬 Science"
            case "entertainment":
                self.categoryLabel.text = "🎮 Gaming"
            case "sports":
                self.categoryLabel.text = "🏈 Sports"
            default: break
            }
            
            DispatchQueue.global().async {
                guard let imageUrl = newsRecommend.imageURL else {
                    DispatchQueue.main.async {
                        self.newsImageView.image = UIImage(named: "noFoto")
                    }
                    return
                }
                let url = URL(string: imageUrl)
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.newsImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    private func configureNewsImageView() {
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.contentScaleFactor = 1.0
        newsImageView.layer.cornerRadius = 20
        newsImageView.layer.masksToBounds = true
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTitleLabel() {
        newsTitleLabel.text = "The latest situation in the presedential election"
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.textAlignment = .left
        newsTitleLabel.font = UIFont.interSemiBold14()
        newsTitleLabel.textColor = .blackPrimary
        newsTitleLabel.adjustsFontSizeToFitWidth = true
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCategoryLabel() {
        categoryLabel.text = "Without category"
        categoryLabel.textAlignment = .left
        categoryLabel.font = UIFont.interRegular14()
        categoryLabel.textColor = .greyPrimary
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Set constraints and add Subview
extension RecommendedCell {
    
    func setupView() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(newsTitleLabel)
        configureNewsImageView()
        configureTitleLabel()
        configureCategoryLabel()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 90),
            newsImageView.heightAnchor.constraint(equalToConstant: 80),
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: newsTitleLabel.topAnchor, constant: -5),
            
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,constant: 15),
            newsTitleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8)

        ])
    }
}

struct Recommend {
    let title: String?
    let category: String?
    let imageURL: String?
    let description: String?
    let author: String?
}
