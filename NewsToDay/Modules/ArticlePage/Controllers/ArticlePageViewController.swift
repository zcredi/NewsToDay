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
