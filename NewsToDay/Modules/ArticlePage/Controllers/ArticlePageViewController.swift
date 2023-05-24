//
//  ArticlePageViewController.swift
//  NewsToDay
//
//  Created by Sergey Medvedev on 10.05.2023.
//

import UIKit
import SnapKit

class ArticlePageViewController: UIViewController {
    
    
    // MARK: - let/var
    let articleView = ArticleView()
    
    // MARK: - lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    func activity() {
        let items:[Any] = ["Text for Share", UIImage(named: "politics")!]
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(avc, animated: true)
    }
    
    func setupData(newsItem: Result) {
        DispatchQueue.global().async {
            guard let imageUrl = newsItem.imageURL else {
                DispatchQueue.main.async {
                    self.articleView.imageView.image = UIImage(named: "noFoto")
                }
                return
            }
            let url = URL(string: imageUrl)
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.articleView.imageView.image = UIImage(data: data)
                }
            }
        }
        articleView.nameAutor.text = newsItem.author
        articleView.themeNewsLabel.text = newsItem.category
        articleView.titleLabel.text = newsItem.title
        articleView.textLabel.text = newsItem.description
        articleView.result = newsItem
        articleView.updateLikeButtonState()
    }
    
    func setupDataRecommend(recommendNews: Recommend) {
        DispatchQueue.global().async {
            guard let imageUrl = recommendNews.imageURL else {
                DispatchQueue.main.async {
                    self.articleView.imageView.image = UIImage(named: "noFoto")
                }
                return
            }
            let url = URL(string: imageUrl)
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.articleView.imageView.image = UIImage(data: data)
                }
            }
            
        }
        articleView.autor.text = recommendNews.author
        articleView.themeNewsLabel.text = recommendNews.category
        articleView.titleLabel.text = recommendNews.title
        articleView.textLabel.text = recommendNews.description
    }
    
    // MARK: - backButtonPressed
        
    @objc
    func backButtonPressed() {
        dismiss(animated: true)
    }
}
    
extension ArticlePageViewController {
    // MARK: - setupViews
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(articleView)
    }
    // MARK: - setConstrains
    private func setConstrains() {
        articleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
