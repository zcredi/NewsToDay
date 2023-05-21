//
//  NewsCell.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    
    static let identifier = "NewsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let newsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "333")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundBlackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "The latest situation in the presedential election"
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = UIFont.interBold16()
        view.textColor = .white
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var categoryLabel: UILabel = {
        let view = UILabel()
        view.text = "Without category"
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = UIFont.interRegular16()
        view.textColor = .greyLighter
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var liked: Bool = false
    
    lazy var favouriteButton: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "bookmark"), for: .normal)
        view.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func favouriteButtonPressed() {
        if liked {
            favouriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            liked = false
        } else {
            favouriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            liked = true
        }
    }
    
    func configureCell(_ newsData: Result) {
        DispatchQueue.main.async {
            self.titleLabel.text = newsData.title
            self.categoryLabel.text = newsData.category
            
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
            default:
                break
            }
            
            DispatchQueue.global().async {
                guard let imageUrl = newsData.imageURL else {
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
    
    private func setupViews() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(backgroundBlackView)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundBlackView.topAnchor.constraint(equalTo: topAnchor),
            backgroundBlackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundBlackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundBlackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -24),
            
            categoryLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 15),
            categoryLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -15),
            categoryLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 25),
            favouriteButton.widthAnchor.constraint(equalToConstant: 25),
            favouriteButton.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 20),
            favouriteButton.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -20)
        ])
    }
}

struct Result {
    let title: String?
    let category: String?
    let imageURL: String?
    let description: String?
    let author: String?
}
